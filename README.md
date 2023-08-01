# Tezos k8s

Tezos-k8s is a collection of Helm charts and container images that can be used to deploy Tezos blockchain infrastructure on a Kubernetes cluster.

This project is a fork of https://github.com/oxheadalpha/tezos-k8s.,

## Documentation

You can find the original documentation for the tezos-k8s at [Tezos-k8s.xyz](https://tezos-k8s.xyz).  

You should follow most of the original documentation except that you will need to add Trilitech's helm repository instead of Oxheadalpha's .

```
helm repo add trilitech https://storage.googleapis.com/trilitech-charts-test/tezos-chain-charts
```


## Development

Please see [DEVELOPMENT.md](./DEVELOPMENT.md)
