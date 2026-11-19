Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070706;
	b=uf6LQI2d1JwsQWOhVhpykplbfqmlx2R/YZbdKYLvMn++/QxROOIkw3xzj8d9Xla9RU7S
	 lEj1ZhnLgZeoDjBC5YWthu0P5bQ/Dib5GuWP3QM4A2Y7qx8eFwM0X543piJkp/MUy+322
	 vhdkVn2KTXx4lBM910x0ncOS3N/X6V/31mVcxpT/AopagdMTZS+e09EvkQxFTGTdEYx+b
	 clv2shr5GcA5M4LzfpjAPu619uiMXk9npNvI+M78GjX69hG/RLeSPjMjBSho+7guMKsil
	 xN7c+ql4qwS1h6BoAGHaXZVDQSwnHn+UJFkBu/NIIDn8f7r/6ct1mPV36Agf4vDE8yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070706;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fsOt81r2UE7NffohmViWawVkV/SETfL9NBoyQgD8Gzs=;
	b=yWZCDvjVr+bH10x74SaCpOiNgAFz+iWRVSiAe09kp42oyTKX9H2mVqVm3BrDbSc3Fuvx
	 mowtAgQCf8sJ/L77OR/xn4B7xb4v1OexkGMQ7To8nUmE45AGpZXZextR4/1NpT9Q/9+O5
	 1P6XD6GkpueU7bsC0VqYswbtlwj3A042N0ggY6qXwjtTA93TKG1kYjPdKxMu6sg+MVM0Z
	 EYIbVlMB8dSEfnHtaEpU31kIDcPM2t3f09cv60urCqdv/sEO4Sa+K6ORgRL37LOisThRn
	 K0uWfD5PV3yL1RFOtbf6Jpt5L8sexXAdVklUquGLN/fOvgMcHuXniCmry13EOLVBRyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHWsZenl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FDB60A2624
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHWsZenl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E11F000C4;
	Thu, 19 Nov 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070705;
	bh=fsOt81r2UE7NffohmViWawVkV/SETfL9NBoyQgD8Gzs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eHWsZenlEppWUDsFKFQDcz40+2WslWI46FGsz/DHedoIyjUdg8v+I/no8KyWpqrmt
	 ynG4rWZU0ZFAJLpHdfV5aVR8uLvC2TX8n6d/jlth4o9Gka07iSWh+XnAUKcH5J6kKC
	 1UAB/H3osbAMCPP+gHOVA9eIWrNPsYBpYgucSjL6sGmmr6wUQHCFwwExznYkbeZC2H
	 LWGio2XuiWdBNqp4nmst1rGq211slBOWQjVa1LHi5zCu+myM14UEcPOMWRrn3XWgR2
	 ZRkjPwZ6GUXjm5eCSq3eAPOnY4uFa/e9STiMz7ZXo3tXc3Yg4NGe63qIfz9BrT4fbo
	 dtoKvbPSPvi7Q==
Subject:
 Re: [net-next v6 12/15] devlink: give user option to allocate resources
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, jacob.e.keller@intel.com,
 jedrzej.jagielski@intel.com, jiri@resnulli.us, leon@kernel.org,
 mbloch@nvidia.com, mschmidt@redhat.com, ohartoov@nvidia.com,
 pabeni@redhat.com, poros@redhat.com, rdunlap@infradead.org, saeedm@nvidia.com,
 skhan@linuxfoundation.org, tariqt@nvidia.com
Date: Thu, 19 Nov 2026 06:45:04 +0000
Message-ID: <179507070407.3136.14784491222272219958@kernel.org>
In-Reply-To: <20261117094913.100756-13-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-13-przemyslaw.kitszel@intel.com>
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

- [Low] API asymmetry in the new occ_set mode, plus an unsafe misuse
  path.
- [Low] The occ_set paths change size_new without revalidating the
  hierarchy.

--

devlink: give user option to allocate resources

This adds a new mode of operation for devlink resources. In this mode a
driver registers an occ_set() callback together with occ_get() through
devl_resource_occ_set_get_register(). DEVLINK_CMD_RESOURCE_SET then
applies the requested size immediately and does not stage it until
reload. For such resources the getter value is reported as
DEVLINK_ATTR_RESOURCE_SIZE.

> diff --git a/net/devlink/resource.c b/net/devlink/resource.c
> index c3cfda7ea0703..c4502c480a6bb 100644
> --- a/net/devlink/resource.c
> +++ b/net/devlink/resource.c

[ ... ]

> @@ -137,6 +139,16 @@ int devlink_nl_resource_set_doit(struct sk_buff *skb, struct genl_info *info)
>  	if (err)
>  		return err;
>  
> +	if (resource->occ_set) {
> +		err = resource->occ_set(size, info->extack, resource->occ_priv);
> +		if (err)
> +			return err;
> +
> +		resource->size = resource->occ_get(resource->occ_priv);
> +		resource->size_new = resource->size;
> +		return 0;
> +	}
> +
>  	resource->size_new = size;
>  	devlink_resource_validate_children(resource);
>  	if (resource->parent)

[Severity: Low]
Should the occ_set branch also revalidate the hierarchy before it returns?

The legacy branch below sets size_new and then calls
devlink_resource_validate_children() on the resource and on its parent.
The occ_set branch changes size_new and returns before doing either.
The occ_set refresh added to devl_resource_size_get() also overwrites
size_new without revalidating.

devlink_resource_validate_children() computes the parent's size_valid
from the sum of the children's size_new. That flag is reported as
DEVLINK_ATTR_RESOURCE_SIZE_VALID. It is also checked by
devlink_resources_validate(), which gates DEVLINK_CMD_RELOAD in
devlink_nl_reload_doit():

    err = devlink_resources_validate(devlink, NULL, info);
    if (err) {
        NL_SET_ERR_MSG(info->extack, "resources size validation failed");

Nothing stops one hierarchy from mixing the two modes. Take a legacy
parent P with an occ_set child A and a legacy child B. Setting B through
the legacy path marks P invalid. If A is then shrunk through occ_set so
the sum fits again, does P stay invalid, so that reload is refused? In
the other direction, growing A through occ_set would leave P reported
as valid.

No in-tree user mixes the modes today. In this series ice registers rss,
lut_512 and lut_2048 all with devl_resource_occ_set_get_register(), so
this is latent. Should this path revalidate mixed hierarchies, or should
they be rejected or documented as unsupported?

[ ... ]

> @@ -684,9 +748,10 @@ void devl_resource_occ_get_unregister(struct devlink *devlink,
>  	if (WARN_ON(!resource))
>  		return;
>  	WARN_ON(!resource->occ_get);
> +	WARN_ON(resource->occ_set);
>  
>  	resource->occ_get = NULL;
> -	resource->occ_get_priv = NULL;
> +	resource->occ_priv = NULL;
>  }
>  EXPORT_SYMBOL_GPL(devl_resource_occ_get_unregister);

[Severity: Low]
Should this WARN_ON(resource->occ_set) return instead of falling
through?

devl_resource_occ_set_get_register() is exported, but
include/net/devlink.h declares no matching unregister. That leaves
devl_resource_occ_get_unregister() as the only detach helper. If it is
called on a resource registered with
devl_resource_occ_set_get_register(), it warns, clears occ_get and
occ_priv, and leaves occ_set set.

The three mode checks then disagree. devlink_resource_occ_size_put()
requires both callbacks, so it takes the legacy path. But
devlink_nl_resource_set_doit() and devl_resource_size_get() check only
occ_set:

    if (resource->occ_set) {
        err = resource->occ_set(size, info->extack, resource->occ_priv);
        ...
        resource->size = resource->occ_get(resource->occ_priv);

Would a later DEVLINK_CMD_RESOURCE_SET call occ_set() with a NULL priv
and then call through the NULL occ_get pointer?
devl_resource_size_get() would make the same call to occ_get.

Nothing in-tree reaches this today. The only user in the series is ice,
which tears down with devl_resources_unregister() and never calls
devl_resource_occ_get_unregister(). Drivers that follow the existing
convention keep resources registered across reload and unregister the
callbacks in fini or reload_down. The new mode offers no way to do that.

Would it make sense to add a matching unregister helper, or have this
one also clear occ_set? Could all three places use the same mode check?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
