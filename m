Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070709;
	b=L78pgAxO0p+CS/eEUK36Bwt5cGAYZqd3UPbVIAdiky1Lo6MUDUrlvMbxM6dPV/gaal1G
	 QgyYe0VJjig1phsIlDA3bzceGhPiva5cv7vBkS60vlu5GOFPoGRHxoSsD74jp/qTnz27X
	 8m0xKQR+IMfG+GpXZS2jD9S265X23xtiIM5X2TUfBHlmUOgJHdeshuNuzbMkcAmUwZGYR
	 LzUEKos/NEa5iSyNhGXsrtnyngR7QvA/mn3+Y5gUfuQXczGNVZI9fRzR6KlPUf3DhB3YZ
	 jtb1itHw55mal5TLW6fUBYodfH7Y2fMqB5hh18psBxMLy6sRLgefVXC/thdsGDRpnHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070709;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QVVsOx83CFeS5iOjUfTV5o1PIkJpd6mLKBvGqbD6e94=;
	b=nkDj2csKQM40uFMgXSU0MlSKQi9nINIV3jVL2YvRyYqlG1Zf6x5lQB5e6Mpn8o75qPe3
	 Blf/UNgzrp3ODsbN0MLiX/+FgWH7YeXF5Q5O+7+o7MDWkhGhIS2ArdfGRkxbvyWIGbxpA
	 Doo/zylfEUW+9bKwaMmOVLQ8zjnak1G7J8gUH1l99wRD4rRehavsi/huuV0PigCQ5X91B
	 nlfqiIYwOOkiQYMay9B9x7tLU9tgkIqfdGSddyFHUQaiKmoxxngIPYbJDCCqsRy89TN+l
	 mLMDBg7BdlAZV7b6YVXnCt1i5GacThC3vbc7kS0NWR1EfW+nWPDRjkGqZpqPHblL2/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y/vBhmVO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F860A260B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y/vBhmVO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0111F000C4;
	Thu, 19 Nov 2026 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070709;
	bh=QVVsOx83CFeS5iOjUfTV5o1PIkJpd6mLKBvGqbD6e94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y/vBhmVOXbN7XJ+y0IZbSNcDBA2ZvdS6tdvJKTs526w1GlL56y9vLqaaQBXlHhgtJ
	 F+Rb9PgG3qs70cpASpohlG/+2apDreA4QLnV3RieXmDBEqeOXizbHgKcbqkq7dStHb
	 uDl0JFpiVQHnd/F2Yk2nuMlU167SIv9Lzqc2HRGxYwKk87H2lDsQVG72LWcYNXNVxi
	 cThn9ia3iMxEWURQf15Is0KWTDaSceTs+xNOjz4KUVTPXjPADIUJH6sVtFOpV9BtNJ
	 /CLgZO3GMaoLgu7U9TfP9jXa3rAEmlFtzrRxNsMN1oCtAA/aBLYhS/mmSUeNmqBR3t
	 aIuW42yAVhxzQ==
Subject: Re: [net-next v6 14/15] devlink: add devlink_alloc_drv()
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
Date: Thu, 19 Nov 2026 06:45:07 +0000
Message-ID: <179507070766.3136.14422997396446697010@kernel.org>
In-Reply-To: <20261117094913.100756-15-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-15-przemyslaw.kitszel@intel.com>
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

- [Low] devlink_alloc_drv() passes @dev straight to __devlink_alloc()
  with no WARN_ON(!dev).

--

devlink: add devlink_alloc_drv()

This adds devlink_alloc_drv(), a variant of devlink_alloc() that takes the
owning driver explicitly. It is meant for a PF driver that creates devlink
instances for its VFs, where the VF device may be bound to another driver
or to none. The devlink-info documentation is updated to say the reported
driver is the creating driver in that case.

> diff --git a/net/devlink/core.c b/net/devlink/core.c
> index 9b844e0c1bd2d..e2a7169287ec7 100644
> --- a/net/devlink/core.c
> +++ b/net/devlink/core.c
> @@ -531,6 +531,30 @@ struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
>  }
>  EXPORT_SYMBOL_GPL(devlink_alloc_ns);
>  
> +/**
> + * devlink_alloc_drv - Allocate new devlink instance resources for given driver
> + * @ops: ops
> + * @priv_size: size of user private data
> + * @dev: parent device
> + * @drv: driver that owns the instance
> + *
> + * Variant of devlink_alloc() for a driver that creates an instance for
> + * a device bound to another (or no) driver, e.g. a PF driver for its VFs.
> + *
> + * @drv must not be NULL and must outlive the instance, only a pointer to it
> + * is kept. Operations that take the device lock, like reload, lock @dev,
> + * not a device bound to @drv.
> + *
> + * Return: new devlink instance, NULL on failure.
> + */
> +struct devlink *devlink_alloc_drv(const struct devlink_ops *ops,
> +				  size_t priv_size, struct device *dev,
> +				  const struct device_driver *drv)
> +{
> +	return __devlink_alloc(ops, priv_size, &init_net, dev, drv);
> +}

[Severity: Low]
This isn't a bug, but should devlink_alloc_drv() also have the
WARN_ON(!dev) that devlink_alloc_ns() has?

net/devlink/core.c:devlink_alloc_ns() {
	WARN_ON(!dev);
	return __devlink_alloc(ops, priv_size, net, dev, dev->driver);
}

The kernel-doc calls @dev the parent device and says reload locks @dev.
If @dev is NULL, __devlink_alloc() goes ahead and creates an index-named
instance, like the one devlink_shd_get() creates. Then devl_dev_lock()
skips the device lock without any warning:

net/devlink/devl_internal.h:devl_dev_lock() {
	if (dev_lock && devlink->dev)
		device_lock(devlink->dev);
	devl_lock(devlink);
}

That doesn't match the kernel-doc.

The same applies to @drv. The kernel-doc says it must not be NULL, but a
NULL @drv only hits the WARN_ON(!ops || !dev_driver) in __devlink_alloc(),
and allocation continues.

The only current caller, ice_init_vf_devlink() in the next patch, returns
early when vf->vfdev is NULL, so no current path passes a NULL @dev. Could
a check for dev be added here (and maybe for drv too) so this variant
behaves like devlink_alloc_ns() and the kernel-doc?

> +EXPORT_SYMBOL_GPL(devlink_alloc_drv);
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
