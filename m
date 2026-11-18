Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022243;
	b=FpbqoEzkbBT0ca37lnz72W9V0eSFZevGIndvcqwgd991PWEFFGtbY22dhSv41mb9vxR7
	 S88U0bSXQ9JDXAGZdudPZBK2G/YpZiTUOjwRCmDNOHAmV5RO6oiLvPNJ4N1sPzLVc19f2
	 AyUIovaCp6lWO+8LZuehw8amguRCO3uH4LgPwHyqorJ9F0EZqIoozbhuhRyRZbJhVa5p1
	 h8TtB53u3XPi1ZFSXfU0XdSeL1aSBwR92lFQgx2Q9+/VXElnNSTSlQ/0oyiXYbZO3ILjm
	 nk2j8MX8uZm+RLWtBM7ySNMEhj3lzLn9aM7OxqkCMqd7YiFxaHCAkMyZTRyEHGiJigw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022243;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=28XEaP/ltV/ETk9fcENFl2aQLFUd74IdM6wgYvIduOw=;
	b=NcUv1nf1BT2lBcv4BwKtfjL+MyUQTpc+FjJH+evKHMJGwTZ1WpRjFYqoRRFkGcz9HVhC
	 BenmLsE3NkLDWhmPpx1/Ogg85vtyPVwN/jHTVXuGIpsGB+ANjzSQo6m/g5Z/6cjvhZhK5
	 vl2tfp1n494ijrbnP6ugqjswTImcCH7GYX0I0z1llZFFqDfsmQip7ys3p5pxV6pNHC3CU
	 R74WGW3wX3ARhuE9eYnbkI3CczgTv/81x/3/yBMApcqcAMkLr5Sa3dOND10Q22yHy6a5y
	 wjEYb4at7AF1S6V8UQk6ydhLbJO1klydm0RyrDe63qZptCtiWZnzk6ukSlo4uZHq26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3m51p1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D528606A32C;
	Wed, 18 Nov 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3m51p1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910DD1F000C4;
	Wed, 18 Nov 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022243;
	bh=28XEaP/ltV/ETk9fcENFl2aQLFUd74IdM6wgYvIduOw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I3m51p1yxSCa+XRhyxBrIPFQediyExc5Zl82Subm6rC9snVZkpaSkqD9McVYcqQF8
	 pFGoVFbnn9iZ6/HPJZFEPA3uQ/wODAHWITb98jbHtx2w2NtO9bZESF30Tqz97yF1fT
	 oV8F2Vno4OBPUzU6W6bxntO4a6QqgOKEYWrqx/QQle9Q/FnZjiiNHO5JxiTGYs/y4W
	 0CKOU0sgnZb8S6S/4u0Yx49srfvleH0YZuvMs0cTL8f/E3eGi35DUbwUyk4v2BrnuU
	 ygFqurvKnKZOMjOe4aS36sqebvLKddv5xbtRtaoxERF7jTpLJH07z7LnKY7A/9acBD
	 qABu+hqO6ZTew==
Subject: Re: [PATCH net-next v4] net: phy: aquantia: Poll global status
 register for provision ID
From: netdev-bot+sashiko@kernel.org
To: hongmei.xu@oss.qualcomm.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sagar.cheluvegowda@oss.qualcomm.com
Date: Wed, 18 Nov 2026 17:17:22 +0000
Message-ID: <179502224211.3136.8031848811478345993@kernel.org>
In-Reply-To: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
References: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new poll in aqr_wait_reset_complete()
  (drivers/net/phy/aquantia/aquantia_main.c, lines 720-734) treats…
- [Low] The commit message says the patch fixes a user-visible defect in
  existing AQR113 support ('Starting subsequent firmware operations…
- [Low] aqr_need_provision_id_check() (aquantia_main.c:684-690) limits
  the new wait to PHY_ID_AQR113 and PHY_ID_AQR113C.
- [Low] When the new PROV_ID poll times out, aqr_wait_reset_complete()
  logs a warning and returns 0 (aquantia_main.c:732-736).

--

net: phy: aquantia: Poll global status register for provision ID

On AQR113 and AQR113C, aqr_wait_reset_complete() now goes on to poll the
PROV_ID field of VEND1_GLOBAL_RSVD_STAT1 until it is non-zero, after the
firmware ID check. A read error is returned to the caller. A poll timeout
only logs a warning, and the function still returns 0.

> Starting subsequent firmware operations before the provision ID is
> valid leads to steady link failures; this has been observed during
> AQR113 PHY bring-up.

[Severity: Low]
This describes a link failure with the existing AQR113 support. That
support already goes through aqr_gen4_config_init()->
aqr_gen1_config_init()->aqr_wait_reset_complete().

Should this carry a Fixes: tag and possibly Cc: stable? Is it meant for
net or net-next?

> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
> index e95d391a6dc23..a5bba9be0d069 100644
> --- a/drivers/net/phy/aquantia/aquantia_main.c
> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> @@ -681,12 +681,24 @@ static int aqr107_set_tunable(struct phy_device *phydev,
>  #define AQR_FW_WAIT_SLEEP_US	20000
>  #define AQR_FW_WAIT_TIMEOUT_US	2000000
>  
> +static bool aqr_need_provision_id_check(struct phy_device *phydev)
> +{
> +	return phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113,
> +			      phydev->drv->phy_id_mask) ||
> +	       phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113C,
> +			      phydev->drv->phy_id_mask);
> +}

[Severity: Low]
This isn't a bug, but AQR114C, AQR115, AQR115C and AQR813 also go
through aqr_gen4_config_init() and aqr_wait_reset_complete(), and they
won't get this wait. The v4 changelog says the narrower scope is
intentional.

Were those parts checked for the same provisioning behaviour? If so,
could the commit message say so?

> +
>  /* If we configure settings whilst firmware is still initializing the chip,
>   * then these settings may be overwritten. Therefore make sure chip
>   * initialization has completed. Use presence of the firmware ID as
>   * indicator for initialization having completed.
>   * The chip also provides a "reset completed" bit, but it's cleared after
>   * read. Therefore function would time out if called again.
> + *
> + * On AQR113 and AQR113C, additionally wait for the provisioning ID to
> + * become non-zero, indicating that firmware provisioning is complete.
> + * Without this polling, link issue can be seen after phy boot.
>   */
>  int aqr_wait_reset_complete(struct phy_device *phydev)
>  {
> @@ -702,7 +714,26 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
>  		return val;
>  	}
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	if (aqr_need_provision_id_check(phydev)) {
> +		ret = read_poll_timeout(phy_read_mmd, val,
> +					val < 0 ||
> +					FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val),
> +					AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT_US,
> +					false, phydev, MDIO_MMD_VEND1,
> +					VEND1_GLOBAL_RSVD_STAT1);

[Severity: Medium]
Is PROV_ID a reliable sign that provisioning is done? Elsewhere in the
driver it looks like a fixed identifier of the firmware image. It sits
next to FW_BUILD_ID and has no validity bit:

drivers/net/phy/aquantia/aquantia.h:
#define VEND1_GLOBAL_RSVD_STAT1_FW_BUILD_ID	GENMASK(7, 4)
#define VEND1_GLOBAL_RSVD_STAT1_PROV_ID		GENMASK(3, 0)

aqr_build_fingerprint() reads it only as one part of the image
fingerprint:

	build_id = FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_FW_BUILD_ID, val);
	prov_id = FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val);

The v4 changelog also says some PHYs use PROV_ID=0 as a valid value.

aqr_need_provision_id_check() decides from the silicon ID. The PROV_ID
value, though, comes from whichever image gets loaded, whether from flash,
nvmem or the filesystem.

What happens if an AQR113/AQR113C runs an image with provisioning ID 0?

The poll could then never succeed. Every call would poll MDIO for the
full AQR_FW_WAIT_TIMEOUT_US (2 seconds) and log "Firmware provisioning ID
not ready". aqr_wait_reset_complete() is called from:

aqr107_probe()->aqr_firmware_load()->aqr_wait_reset_complete()

phy_init_hw()->aqr_gen4_config_init()->aqr_gen3_config_init()->
  aqr_gen2_config_init()->aqr_gen1_config_init()->
  aqr_wait_reset_complete()

Would bring-up then take at least 4 seconds per PHY, plus 2 seconds on
every attach and resume?

The commit message also seems to contradict itself. It says that starting
operations before the provision ID is valid "leads to steady link
failures", but also that a timeout "does not necessarily prevent link
establishment".

It also says a timeout "indicates a hardware-level provisioning failure".
Nothing in the driver appears to support that.

The driver already polls readiness signals tied to hardware state. One is
the wait_on_global_cfg poll of VEND1_GLOBAL_CFG_100M in
aqr_gen2_fill_interface_modes(). Another is
VEND1_GLOBAL_GEN_STAT2_OP_IN_PROG. Would one of those work for AQR113
instead?

> +		if (val < 0) {
> +			phydev_err(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
> +				   ERR_PTR(val));
> +			return val;
> +		}
> +		if (ret)
> +			phydev_warn(phydev, "Firmware provisioning ID not ready\n");
> +	}
> +
> +	return 0;
>  }

[Severity: Low]
This isn't a bug, but the new comment above aqr_wait_reset_complete()
says the function waits for the provisioning ID, "indicating that
firmware provisioning is complete". On timeout it only warns and
returns 0, so callers cannot tell that provisioning did not finish.

Returning 0 here looks right. aqr_firmware_load() treats -ETIMEDOUT as
"no firmware loaded" and would load a new image over the running one.
Also, aqr_gen1_config_init() does the downshift, MDI and LED writes
whatever this returns.

Could the comment say that the provisioning wait is best effort? Could it
also say that the link failure described in the commit message can still
happen after a timeout?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a%40oss.qualcomm.com
