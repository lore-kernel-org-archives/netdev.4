Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557463;
	b=kFUgOU0rk/htcd4+OCfI3ECjCdkawfmx3lBozHBSXUVM0v9XpGDALujmpkvSM6H5nXij
	 cpjWrRh28UnSe4yQjX9/M5upgdqAZ353z+s33MMVVhVGCvASK/kbpB6f4en8EGbnquq7a
	 T8YK/kUtrHcNUgOnf/tWwqTMKtlMuxJo4Cyc/Zf529O4DjWhGRWAgMej3/BfnaRxk8x0I
	 GMN9NfPvU5tMV3sbzR0AVxcm7mJGJ2o4ydKbo+vj3RtwDUJ4ZhZvDigw3mdAQkBgVzEsR
	 yLxoJQqgONkhTxU4AW0LpMRe9GJR9cP1ZrNdHQCRm4gNeKuETPS2U4IR9HImZhPV2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557463;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6PNntuIrVGm/tj729jbnyjyledX6SaQRphGjbATF3JA=;
	b=sLZ4qn33Jc5jgjiEIu4ceHuBPls+PWSEumf14n+3soMLyTg80Q5dPKFz8uJxDNOxVPSP
	 gJnjsQuj5XWYfQLv971SeNGj5MYNogOKusVz6YPJFJhLwFX7WeaWGIvoZc3kIG41luUGN
	 oHvpDdD2zeKZPp1ZEvQIlWCA+tkXZzRENLS02HDw+HIRdZE6hXDF/9NLqD1cVAWCerTlf
	 HbnkOSBu69SftDKMw85Cw8aa31qygn/tjkkeEydPHX4w9quJW5K7FMxlCd2VWxef2Mzaj
	 0lzLTlDQZz6rc3ya6vLSrMJIIgQOevyTXBND9RRNwjdsnO/e091/hSkr95AbCj6A1MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVSw2zB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA56606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVSw2zB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA81F000C0;
	Tue, 24 Nov 2026 21:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557463;
	bh=6PNntuIrVGm/tj729jbnyjyledX6SaQRphGjbATF3JA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UxVSw2zBqnr3eOQ0wwmenu5I2QNDd73vVsxtso7jgGq7AZPmjk3l5KXaQIvFeZNNf
	 88z93zECIr5MPMntTY3Shq8o7n8HU93AYEi1ukbGuXRmWo9Nvo3uoQ9Dm6drY2rX5g
	 Actv7m63ZT9y0xEu1Ru0YLmQQJtTeBfRr0BSYjTUnI9sShpb1SnoU8iP0SrtLtQe/z
	 4pc7u8JQ4Mrj4ioGdlOJm0UCA6QW3UkCeJCBp+Ks/qtADRPFmlAE0XqIfG49uPGWL8
	 YjhNMXL7tQFkmisFTuBkUTqyXXe8vvzg2kHqPrawy8j/gFvj93f3kLVGy5gzvBkCaC
	 ObL1aoPUK4/cA==
Subject: Re: [PATCH net-next v7 12/15] devlink: add cmode to resources
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, jiri@resnulli.us,
 anthony.l.nguyen@intel.com, aleksandr.loktionov@intel.com,
 mschmidt@redhat.com, edumazet@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, poros@redhat.com,
 donald.hunter@gmail.com
Date: Tue, 24 Nov 2026 21:57:41 +0000
Message-ID: <179555746177.3135.11818497845651509836@kernel.org>
In-Reply-To: <20261121230123.316391-13-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-13-przemyslaw.kitszel@intel.com>
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

- [Low] Every resource now reports DEVLINK_ATTR_RESOURCE_CMODE.

--

devlink: add cmode to resources

This adds a configuration mode to devlink resources and reuses enum
devlink_param_cmode for it. Resources default to driverinit. A driver can
make a resource runtime with devl_resource_runtime_register(), and then
DEVLINK_CMD_RESOURCE_SET applies the new size right away through a driver
callback. The new DEVLINK_ATTR_RESOURCE_CMODE is reported for every
resource, and it may also be passed to DEVLINK_CMD_RESOURCE_SET.

> diff --git a/net/devlink/resource.c b/net/devlink/resource.c
> index c3cfda7ea0703..2d31dac85eb15 100644
> --- a/net/devlink/resource.c
> +++ b/net/devlink/resource.c

[ ... ]

> @@ -183,8 +210,10 @@ static int devlink_resource_put(struct devlink *devlink, struct sk_buff *skb,
>  		return -EMSGSIZE;
>  
>  	if (nla_put_string(skb, DEVLINK_ATTR_RESOURCE_NAME, resource->name) ||
> -	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE, resource->size) ||
> -	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_ID, resource->id))
> +	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE,
> +			       devlink_resource_size(resource)) ||
> +	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_ID, resource->id) ||
> +	    nla_put_u8(skb, DEVLINK_ATTR_RESOURCE_CMODE, resource->cmode))
>  		goto nla_put_failure;

[Severity: Low]
What cmode should port-level resources report here?

Port resources are registered via devl_port_resource_register() ->
__devl_resource_register(), so they always get
DEVLINK_PARAM_CMODE_DRIVERINIT. devlink_resource_put() then reports that
value when a port's resources are dumped.

But a port resource can never get a new size, not even on reload.
devlink_nl_resource_set_doit(), devl_resource_runtime_register() and
devl_resource_size_get() only search devlink->resource_list:

    resource = devlink_resource_find(devlink, NULL, resource_id);

DEVLINK_CMD_RESOURCE_SET also uses devlink_nl_pre_doit, and its policy
has no DEVLINK_ATTR_PORT_INDEX. So devlink_port->resource_list is never
reached on the set path.

The new spec doc for resource-cmode in
Documentation/netlink/specs/devlink.yaml says:

    Configuration mode of the resource, when a new size takes effect.
    Runtime resources apply it immediately, others on driver reload.

devlink-resource.rst says "The default, driverinit, is described above",
which points to the reload-based semantics. Neither statement holds for
port resources. The commit message and the docs don't mention port
resources at all.

DEVLINK_ATTR_RESOURCE_CMODE becomes uAPI once it is released. Could the
docs describe the port resource exception? Or could the cmode be left out
for resources that can't be set at all?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
