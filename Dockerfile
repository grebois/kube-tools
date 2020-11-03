FROM alpine

RUN apk add --update curl && rm -rf /var/cache/apk/*

ENV KUBECTL=1.18.2
RUN echo "downloading kubectl ${KUBECTL}" \
    && curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
    -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl && kubectl version --client

ENV KUSTOMIZE=3.5.5
RUN echo "downloading kustomize ${KUSTOMIZE}" \
    && curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
    tar xz && mv kustomize /usr/local/bin/kustomize && kustomize version

ENV HELM_V2=2.16.7
RUN echo "downloading helm ${HELM_V2}" && curl -sSL https://get.helm.sh/helm-v${HELM_V2}-linux-amd64.tar.gz | \
    tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64 && helm version --client

ENV HELM_V3=3.2.1
RUN echo "downloading helm ${HELM_V3}" && curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
    tar xz && mv linux-amd64/helm /usr/local/bin/helmv3 && rm -rf linux-amd64 && helmv3 version

ENV KUBEVAL=0.15.0
RUN echo "downloading kubeval ${KUBEVAL}" && curl -sL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL}/kubeval-linux-amd64.tar.gz | \
    tar xz && mv kubeval /usr/local/bin/kubeval && kubeval --version

ENV KUBEAUDIT=0.11.5
RUN echo "downloading kubeaudit ${KUBEAUDIT}" && curl -sSL https://github.com/Shopify/kubeaudit/releases/download/v${KUBEAUDIT}/kubeaudit_${KUBEAUDIT}_linux_amd64.tar.gz | \
    tar xz && mv kubeaudit /usr/local/bin/kubeaudit && kubeaudit --help

ENV CONFTEST=0.19.0
RUN echo "downloading conftest ${CONFTEST}" && curl -sL https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST}/conftest_${CONFTEST}_Linux_x86_64.tar.gz | \
    tar xz && mv conftest /usr/local/bin/conftest && conftest --version

ENV KUBESEAL=0.12.5
RUN echo "downloading kubeseal ${KUBESEAL}" && curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL}/kubeseal-linux-amd64 \
    -o /usr/local/bin/kubeseal && chmod +x /usr/local/bin/kubeseal && kubeseal --version

ENV KOPS=1.18.2
RUN curl -Lo kops https://github.com/kubernetes/kops/releases/download/v${KOPS}/kops-linux-amd64 \
    && chmod +x ./kops && mv ./kops /usr/local/bin/ && kops version

RUN echo "downloading yq" && curl -sL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq && yq --version

RUN echo "downloading jq" && curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
    -o /usr/local/bin/jq && chmod +x /usr/local/bin/jq && jq --version

ENTRYPOINT ["sh"]
