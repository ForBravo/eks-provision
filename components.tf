module "components" {
  source       = "./components"
  cluster_name = module.eks.cluster_id
}