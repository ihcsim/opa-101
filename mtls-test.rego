package linkerd.io

test_violation {
  input := {"review": input_review, "parameters": input_parameters}
  results := violation with input as input
  trace(sprintf("results: %v", [results]))
  count(results) == 0
}

input_review = {
  "object": {
    "spec": {
      "containers": [
        {
          "name": "linkerd-proxy",
          "env": [
            {"name": "LINKERD2_PROXY_LOG", "value": "warn,linkerd2_proxy=info"},
            {"name": "LINKERD2_PROXY_DESTINATION_SVC_ADDR", "value": "linkerd-dst.linkerd.svc.cluster.local:8086"},
            {"name": "LINKERD2_PROXY_CONTROL_LISTEN_ADDR", "value": "0.0.0.0:4190"},
            {"name": "LINKERD2_PROXY_ADMIN_LISTEN_ADDR", "value": "0.0.0.0:4191"},
            {"name": "LINKERD2_PROXY_OUTBOUND_LISTEN_ADDR", "value": "127.0.0.1:4140"},
            {"name": "LINKERD2_PROXY_INBOUND_LISTEN_ADDR", "value": "0.0.0.0:4143"},
            {"name": "INKERD2_PROXY_DESTINATION_GET_SUFFIXES", "value": "svc.cluster.local."},
            {"name": "LINKERD2_PROXY_DESTINATION_PROFILE_SUFFIXES", "value": "svc.cluster.local."},
            {"name": "INKERD2_PROXY_INBOUND_ACCEPT_KEEPALIVE", "value": "10000ms"},
            {"name": "LINKERD2_PROXY_OUTBOUND_CONNECT_KEEPALIVE", "value": "10000ms"},
            {"name": "LINKERD2_PROXY_DESTINATION_CONTEXT", "value": "ns:$(_pod_ns)"},
            {"name": "LINKERD2_PROXY_IDENTITY_DIR", "value": "/var/run/linkerd/identity/end-entity"},
            {"name": "LINKERD2_PROXY_IDENTITY_TRUST_ANCHORS", "value": "-----BEGIN CERTIFICATE-----\nMIIBgzCCASmgAwIBAgIBATAKBggqhkjOPQQDAjApMScwJQYDVQQDEx5pZGVudGl0\neS5saW5rZXJkLmNsdXN0ZXIubG9jYWwwHhcNMTkxMDA4MDMwNTI2WhcNMjAxMDA3\nMDMwNTQ2WjApMScwJQYDVQQDEx5pZGVudGl0eS5saW5rZXJkLmNsdXN0ZXIubG9j\nYWwwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAS+MJsi0g9gTJwYvB+dIdBmMv55\nft2lJcXCDjg4jiKP2L4Y98A2nYC2qPFiKLkok3lt1WaFbK3xcO6RcmxOfT21o0Iw\nQDAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC\nMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIgeAkIu5cKGAXX5rN8\n/pFblagMzMjbcuxQIrDhvPA0FJ8CIQC4DkRNFY1E2lwZFRyN+YXEmGxfT6COdCft\nYYd6OH86eQ==\n-----END CERTIFICATE-----"},
            {"name": "LINKERD2_PROXY_IDENTITY_TOKEN_FILE", "value": "/var/run/secrets/kubernetes.io/serviceaccount/token"},
            {"name": "LINKERD2_PROXY_IDENTITY_SVC_ADDR", "value": "localhost.:8080"},
            {"name": "_l5d_ns", "value": "linkerd"},
            {"name": "_l5d_trustdomain", "value": "cluster.local"},
            {"name": "LINKERD2_PROXY_IDENTITY_LOCAL_NAME", "value": "$(_pod_sa).$(_pod_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
            {"name": "LINKERD2_PROXY_IDENTITY_SVC_NAME", "value": "linkerd-identity.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
            {"name": "LINKERD2_PROXY_DESTINATION_SVC_NAME", "value": "linkerd-destination.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
            {"name": "LINKERD2_PROXY_TAP_SVC_NAME", "value": "linkerd-tap.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"}
          ]
        }
      ]
    }
  }
}

input_parameters = {
  "proxy": {
    "name": "linkerd-proxy"
  },
  "env": [
    {"name": "LINKERD2_PROXY_LOG", "value": "warn,linkerd2_proxy=info"},
    {"name": "LINKERD2_PROXY_DESTINATION_SVC_ADDR", "value": "linkerd-dst.linkerd.svc.cluster.local:8086"},
    {"name": "LINKERD2_PROXY_CONTROL_LISTEN_ADDR", "value": "0.0.0.0:4190"},
    {"name": "LINKERD2_PROXY_ADMIN_LISTEN_ADDR", "value": "0.0.0.0:4191"},
    {"name": "LINKERD2_PROXY_OUTBOUND_LISTEN_ADDR", "value": "127.0.0.1:4140"},
    {"name": "LINKERD2_PROXY_INBOUND_LISTEN_ADDR", "value": "0.0.0.0:4143"},
    {"name": "INKERD2_PROXY_DESTINATION_GET_SUFFIXES", "value": "svc.cluster.local."},
    {"name": "LINKERD2_PROXY_DESTINATION_PROFILE_SUFFIXES", "value": "svc.cluster.local."},
    {"name": "INKERD2_PROXY_INBOUND_ACCEPT_KEEPALIVE", "value": "10000ms"},
    {"name": "LINKERD2_PROXY_OUTBOUND_CONNECT_KEEPALIVE", "value": "10000ms"},
    {"name": "LINKERD2_PROXY_DESTINATION_CONTEXT", "value": "ns:$(_pod_ns)"},
    {"name": "LINKERD2_PROXY_IDENTITY_DIR", "value": "/var/run/linkerd/identity/end-entity"},
    {"name": "LINKERD2_PROXY_IDENTITY_TRUST_ANCHORS", "value": "-----BEGIN CERTIFICATE-----\nMIIBgzCCASmgAwIBAgIBATAKBggqhkjOPQQDAjApMScwJQYDVQQDEx5pZGVudGl0\neS5saW5rZXJkLmNsdXN0ZXIubG9jYWwwHhcNMTkxMDA4MDMwNTI2WhcNMjAxMDA3\nMDMwNTQ2WjApMScwJQYDVQQDEx5pZGVudGl0eS5saW5rZXJkLmNsdXN0ZXIubG9j\nYWwwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAS+MJsi0g9gTJwYvB+dIdBmMv55\nft2lJcXCDjg4jiKP2L4Y98A2nYC2qPFiKLkok3lt1WaFbK3xcO6RcmxOfT21o0Iw\nQDAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC\nMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIgeAkIu5cKGAXX5rN8\n/pFblagMzMjbcuxQIrDhvPA0FJ8CIQC4DkRNFY1E2lwZFRyN+YXEmGxfT6COdCft\nYYd6OH86eQ==\n-----END CERTIFICATE-----"},
    {"name": "LINKERD2_PROXY_IDENTITY_TOKEN_FILE", "value": "/var/run/secrets/kubernetes.io/serviceaccount/token"},
    {"name": "LINKERD2_PROXY_IDENTITY_SVC_ADDR", "value": "localhost.:8080"},
    {"name": "_l5d_ns", "value": "linkerd"},
    {"name": "_l5d_trustdomain", "value": "cluster.local"},
    {"name": "LINKERD2_PROXY_IDENTITY_LOCAL_NAME", "value": "$(_pod_sa).$(_pod_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
    {"name": "LINKERD2_PROXY_IDENTITY_SVC_NAME", "value": "linkerd-identity.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
    {"name": "LINKERD2_PROXY_DESTINATION_SVC_NAME", "value": "linkerd-destination.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"},
    {"name": "LINKERD2_PROXY_TAP_SVC_NAME", "value": "linkerd-tap.$(_l5d_ns).serviceaccount.identity.$(_l5d_ns).$(_l5d_trustdomain)"}
  ]
}
