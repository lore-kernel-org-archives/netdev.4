Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045549;
	b=tR78/Hvccie72SzevSk01o2wPi2bvr92hkr/YAFyStRopK/1hNoRNd1dxSMNo6jZE/vC
	 e5/FWLh6Sk0ooYwWVjQZVVr3MRVV4qDsfjb/Fpqg4iTCWk+uo3aekPgXGz3EKoSeodcd/
	 6S21rS6XboII9ES8r3cCNBE9eByMAKxDpnBO5oR/D6/MSeRYnBzOIFVk70SX8g5GfNo7P
	 s8rn+7HkHlG05owhPVt9YJYBb2ANPKD2o6qbMPa/mBya9mJ/zUjJqdri1grjIrUtwPghJ
	 DB0F1d1Y5gULqyMfVzlw26WRhCBQTeuB1HoHtU3z7I2ey3xXJzRSjD4THTTglf6yzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045549;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=khweflAQGw5lIrc/EpOj+dKbxs1Vkxhvo//vwMZ4GbM=;
	b=CPzUHfPoFlyhLp+misl4GPaz1daUQhB9SaNBm8vXHGj2wx2H0UNnqbAb7selPmubxzUE
	 T1oMUabI7u8tPMDSfGq7RoOumpzjgp2cHWgNiGPhMEZ16YPNkKob+zNg9xKiUwnesuTtL
	 mjpyXAMgdBJbCCWxTrgg71Tgu2UHek7FJDRAMRYLYMbhXAuDfKxu/2AT1rIvrIjqmUKb6
	 8r1rW1FOcSsyb2NzuJi7ZTU1Ulx4Q3IlCslRMgz5xfCyyMR7evt6AS4AObkHt6IM2jZX5
	 gmBM/FvVT6KP9X1AnnfWnH8bGsjvHV3uI6Y0U0iUSFu7kMzrHYD/T7n71s0vjnxXUuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePKH6g3H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB2606A31C;
	Wed, 18 Nov 2026 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePKH6g3H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8A21F000C4;
	Wed, 18 Nov 2026 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045549;
	bh=khweflAQGw5lIrc/EpOj+dKbxs1Vkxhvo//vwMZ4GbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ePKH6g3HU5VEpSC3VAVCu8OAK5f1MEBq7SSQmWihto1bv5ZFaIjA8sYeg/RuVRGAW
	 OYYDdhtKShzbQ5Pdyb95qZpZ4ZSAaz9g4mQpVc/PdAgch5REowxFRCzZ6e5SpfwxJ3
	 XtPPbT+aGaaCpFnkly5g2rJ6cZbpS5b2dQqqUEwDCwM/wk8HJbHQpd/ORptP4hKz68
	 2eTG+PS2lVm+Zx1yN6mmnFvxC/xVimpVuoYCunZQdtV26uX8Jph3eBylEpWZsOEgrl
	 4V9y+nYnTQDsVEQ9HeiICnyVmReQhUEmEZeCIASGn0gG/rxeO0yXBVolSThGggml/k
	 1uoBdQrS/oK4w==
From: Jakub Kicinski <kuba@kernel.org>
To: mmyangfl@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5] net: dsa: motorcomm: Add devlink info and resources
Date: Wed, 18 Nov 2026 15:45:47 -0800
Message-ID: <20261118234547.3615845-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116121627.1182631-1-mmyangfl@gmail.com>
References: <20261116121627.1182631-1-mmyangfl@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email says "AI is right, see below"
---
net: dsa: motorcomm: Add devlink info and resources

This patch adds devlink support to the yt921x DSA driver. It reports the
ASIC model through devlink info as asic.id. It also registers two devlink
resources, "ACL" and "meters", each with an occupancy callback.

> diff --git a/drivers/net/dsa/motorcomm/devlink.c b/drivers/net/dsa/motorcomm/devlink.c
> new file mode 100644
> index 0000000000000..7b4f3a460f1b3
> --- /dev/null
> +++ b/drivers/net/dsa/motorcomm/devlink.c

[ ... ]

> +int
> +yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
> +			    struct netlink_ext_ack *extack)
> +{
> +	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
> +	int res;
> +
> +	res = devlink_info_version_fixed_put(req,
> +					     DEVLINK_INFO_VERSION_GENERIC_ASIC_ID,
> +					     priv->info->name);

[ ... ]

> +static const struct yt921x_devlink_resource yt921x_devlink_resources[] = {
> +	{
> +		"ACL", yt921x_devlink_occ_get_acl,
> +		YT921X_ACL_NUM,
> +		YT921X_DEVLINK_RESOURCE_ID_ACL,
> +		DEVLINK_RESOURCE_ID_PARENT_TOP,
> +	},
> +	{
> +		"meters", yt921x_devlink_occ_get_meter,
> +		YT921X_METER_NUM,
> +		YT921X_DEVLINK_RESOURCE_ID_METER,
> +		DEVLINK_RESOURCE_ID_PARENT_TOP,
> +	},
> +};

[Severity: Low]
This isn't a bug, but should there be a driver-specific devlink document
for yt921x to go with this patch?

Documentation/networking/devlink/index.rst says:

    Each driver that implements ``devlink`` is expected to document what
    parameters, info versions, and other features it supports.

There is no yt921x or motorcomm .rst file under
Documentation/networking/devlink/, and the toctree in index.rst has no
entry for it. A similar DSA driver, mv88e6xxx, does have one.

The "ACL" and "meters" resource names are driver-specific, so users of
devlink resource show have no documented meaning for them. The same goes
for the asic.id value that yt921x_dsa_devlink_info_get() reports.

Also, "meters" counts only the 64 custom meters tracked in
priv->meters_map. It leaves out the 11 dedicated per-port meters. The only
place that says so is a comment in chip.h:

    /* Custom meters only, not including dedicated port meters (11) */
    #define YT921X_METER_NUM	64

Could a short Documentation/networking/devlink/yt921x.rst describe the
info version and the two resources, including what "meters" covers?
-- 
pw-bot: cr
