Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806225;
	b=XskdSQcQ3leANTudNiP+PlPhyFzXkqjU7Ti9DPcub5f8gTBenoiAcQUuHoaYcCgHTup8
	 x2bplDhxKh+SStntzybdI6TvbeYzzieZLnFLXv4ZhMMyEOKVpoR3XTW3pj9OtpdoOGPGh
	 r/ZXn2wpZo0KAt9YhLjcNx4LGi8mEsF2AV3P060rwUuLGxQtCETew5nIWL72e+Uqz2q6X
	 mueK390PvsNtZURBoTrZARInhRtSoQuek8W+DssnSHTyrNiyqiK7h+KQJXLu6wuOCTWuZ
	 98HCrqS8IBpuHEw9iqKglEI3j3I1Ye9WC2C0jyGc1ZNe4zllwRhyBgmez1EHLVOjJoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806225;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jafXnWhpURDif5fLvsPb76l702QRhjzhHxDiU2hA4Hk=;
	b=peft3P+wE5J1ReQ3aIAnOp00gr9q17ASwRgf7zEcxzydfN8+dXf/4qHJRMXy5Nyc+st5
	 OSIOkPe4IUqzQuoZFEEaFG1f08HY+1M6CBMy4zbAZQxBSgB6Ni5MfzhlI/ZvdUyOa2gyD
	 zXlnRwwjh+mIQ0ncA9QWnb+r3dHKEpsW/W8O0bfCNb35D+/okjhX5xgAhIpHOldFKuk4B
	 Scbf0PeTV+ME96uZZI0681NueeshrTl5xWgU6UZ/8V+jgq54Hnexcpgz+P1D5N1/4mq+z
	 9egtsXzfFJpyxuaMQ0hBnBhB+xAYyGihSybAywFrytniM4Ly4NoMLGQpJYNac6AjTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvalCSKm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B1D606A338;
	Fri, 27 Nov 2026 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvalCSKm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFA91F000C1;
	Fri, 27 Nov 2026 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795806224;
	bh=jafXnWhpURDif5fLvsPb76l702QRhjzhHxDiU2hA4Hk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fvalCSKmiqVGcTK8weykHhx2xgNRYao3bA8AW9OHZI4ClPQTWqJr4RQ202m7tCeHa
	 7INLIFe6hYiN4dYke9jgIyGJGcEZr/Hc3e6yptbm0KAVa7SfsfvMcTwZ+uggAZh+Y7
	 tPQzfvRMk22ZN7oVx0jOXHcAN1QFDwav2yZv3pp/XI+yQtNieBmrQXHv61+FBBSVey
	 mOHSacWxygRtuaglmFiwkGaqAN50/cJIJL+VtnnZy8uixd9SANoEJK3bTUiC3nYcnT
	 M+enZs06BamI5hOiJk5THsDmQ2SsbJkO9cw1Hj/z2QQn9evQZSY5IKdREdgPbhQvnR
	 H4Sxpjb9a6hFg==
Subject: Re: [PATCH net-next V3 4/5] net/mlx5: nodnic: Add ethtool driver info
From: netdev-bot+sashiko@kernel.org
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 cjubran@nvidia.com, gal@nvidia.com, linux-kernel@vger.kernel.org,
 shshitrit@nvidia.com, horms@kernel.org
Date: Fri, 27 Nov 2026 19:03:43 +0000
Message-ID: <179580622390.3135.423426456579450478@kernel.org>
In-Reply-To: <20261126182448.707782-5-tariqt@nvidia.com>
References: <20261126182448.707782-5-tariqt@nvidia.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c,
  mlx5_nodnic_get_drvinfo() copies KBUILD_MODNAME into drvinfo->driver…

--

net/mlx5: nodnic: Add ethtool driver info

This adds a get_drvinfo ethtool callback to the nodnic driver. It reports
the driver name, the firmware version read from the initialization
segment, and the PCI bus information.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> index 9ab996a6ebaf0..bdbe76b8dbcba 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c

[ ... ]

> +static void mlx5_nodnic_get_drvinfo(struct net_device *netdev,
> +				    struct ethtool_drvinfo *drvinfo)
> +{
> +	struct mlx5_nodnic_priv *priv = netdev_priv(netdev);
> +	struct mlx5_nodnic_core_dev *mdev = priv->core_dev;
> +
> +	strscpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
> +	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
> +		 "%d.%d.%04d", mlx5_nodnic_fw_rev_maj(mdev),
> +		 mlx5_nodnic_fw_rev_min(mdev), mlx5_nodnic_fw_rev_sub(mdev));
> +	strscpy(drvinfo->bus_info, dev_name(mdev->device),
> +		sizeof(drvinfo->bus_info));
> +}

[Severity: Low]
This isn't a bug, but are the two strscpy() calls in
mlx5_nodnic_get_drvinfo() needed?

ethtool_get_drvinfo() in net/ethtool/ioctl.c already fills in these
fields from the parent device:

net/ethtool/ioctl.c:ethtool_get_drvinfo() {
    ...
	if (ops->get_drvinfo) {
		ops->get_drvinfo(dev, &rsp->info);
		if (!rsp->info.bus_info[0] && parent)
			strscpy(rsp->info.bus_info, dev_name(parent), ...);
		if (!rsp->info.driver[0] && parent && parent->driver)
			strscpy(rsp->info.driver, parent->driver->name, ...);
	} else if (parent && parent->driver) {
		strscpy(rsp->info.bus_info, dev_name(parent), ...);
		strscpy(rsp->info.driver, parent->driver->name, ...);
	}
    ...
}

For this driver, mlx5_nodnic_build_netdev() calls
SET_NETDEV_DEV(netdev, core_dev->device), and core_dev->device is
&pdev->dev. parent->driver->name comes from mlx5_nodnic_core_driver,
whose .name is KBUILD_MODNAME in the same mlx5_nodnic module. The core
therefore produces the same driver and bus_info strings this callback
writes.

Could the callback fill only fw_version and leave driver and bus_info
to the core?

On the same point, the commit message says:

    Implement the get_drvinfo ethtool operation to report the driver name,
    firmware version, and PCI bus information.

Before this patch, "ethtool -i" already showed the mlx5_nodnic driver
name and the PCI bus info. Would it be more accurate for the commit
message to say that only the firmware version is new?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182448.707782-1-tariqt%40nvidia.com
