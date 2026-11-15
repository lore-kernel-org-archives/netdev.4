Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747524;
	b=5Qdkl3pH5/OLU4d/EeVtmtQGPKpMdJhupNebkWK9BIGOdBhmfF/SWWqizdzCj1wzAVQy
	 v2GD6PF5KZ/bDZV3dEbupyjugVb1lyQQkQQFvRt0JzXejGvgzJL/eaXV4PLQDAQoqMqqF
	 vzSwnpvki+DncyFquXcSqwagCaw7Pp3OCmUcqeAuTYAM3+aSv9QRdutqWnOlU7Ws6cAAY
	 dGSPdlOhD3Q5Q85T3VeSa5WI8jv43e/yjRHAki0DONiUgdTZ5uWhO7MAb3P+Mr6fFiNYy
	 HNb7+ExaiC7yeRCg5hekP6tXpy4FpTDQEwxIytkhTckjgeMHLcmFPDrJbDgBxFuqAmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747524;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gWntrJtlP68DocKhRKZpl0hzk7XL5osbaLsoTBjJDPc=;
	b=tR17QPIzhG5CP3OAeYClMh2/DGt1RdhJ1USzWvP3pECOb9aQsOIeBQngLp6E1mHw5Sa+
	 pUciyJgZb5n3Xq/ddaxK87USpHjAh470CIAGJDSpefHuvZsREAkAw4qt8uJqY2W5gUHuf
	 laaa4CCEPFmQ1886YESMgi+piLLRDBLlBcy9XLKdMjaaJVofsgsKRbhM6WQd1d6cUNCml
	 czE99dIN1X1h+5IFHfFpMXbPOK0PHjUFG0ZxO3lKFdqOyuPYkqQsBd30XwQbQPzFzzXh6
	 +MPif/qxBBbmvHn8dxOyZPIx2pJW8V+KlzlVuiln97Gn89ZWYAhDz8nmCBFRKRQqANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRCFYG7i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEC606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRCFYG7i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8741F1F000C4;
	Sun, 15 Nov 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747524;
	bh=gWntrJtlP68DocKhRKZpl0hzk7XL5osbaLsoTBjJDPc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YRCFYG7iXAWnqjo1nkvj8t51Z+xeh+4G10vvh6trnzoNsQT5f6nOufJ9WtrskZVeh
	 6DHha/8n5LOEjhLupnOg4dWkUzKaz6W22Lend8Vy+zhVJYM7aEAs2YyPiDpb9Ll/W4
	 nvxAPie5mYGhyJEX7TVgjNUIISL5vIKWQKdU01kn0QGl0hgM+Yuhc6dpGMiUx2lo7o
	 1uunXzMsjzANRG/98SWVVjU9YgKAU0teD8+VQzNJ5QPHI2G3hCCzRcuPxgr15mZe6N
	 eUkqmn4FtrciBvVk75U1lC25ydq+1iqRvQAci5itc/SFuOZetQLf6y0F7KGbkXFkqZ
	 P7tiejfqamxmw==
Subject: Re: [PATCH net v2 3/4] tg3: Skip querying for management FW when no
 NCSI present
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com,
 vishvambar.panth-s@broadcom.com
Date: Sun, 15 Nov 2026 12:58:43 +0000
Message-ID: <179474752307.2199510.11924630055532409529@kernel.org>
In-Reply-To: <20261111123917.910416-4-pavan.chebbi@broadcom.com>
References: <20261111123917.910416-4-pavan.chebbi@broadcom.com>
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

- [Low] tg3: missing APE FW readiness check in tg3_read_dash_ver() and
  wrong Fixes tag

--

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -16045,19 +16045,21 @@ static void tg3_probe_ncsi(struct tg3 *tp)
>  
>  static void tg3_read_dash_ver(struct tg3 *tp)
>  {
> -	int vlen;
> -	u32 apedata;
>  	char *fwtype;
> -
> -	apedata = tg3_ape_read32(tp, TG3_APE_FW_VERSION);
> +	u32 apedata;
> +	int vlen;
>  
>  	if (tg3_flag(tp, APE_HAS_NCSI))
>  		fwtype = "NCSI";
>  	else if (tp->pdev->device == TG3PCI_DEVICE_TIGON3_5725)
>  		fwtype = "SMASH";
> +	else if (tg3_asic_rev(tp) == ASIC_REV_5719 ||
> +		 tg3_asic_rev(tp) == ASIC_REV_5720)
> +		return;
>  	else
>  		fwtype = "DASH";
>  
> +	apedata = tg3_ape_read32(tp, TG3_APE_FW_VERSION);
>  	vlen = strlen(tp->fw_ver);
>  
>  	snprintf(&tp->fw_ver[vlen], TG3_VER_SIZE - vlen, " %s v%d.%d.%d.%d",

[Severity: Low]
tg3_read_fw_ver() calls tg3_read_dash_ver() unconditionally after
tg3_probe_ncsi(). That happens even when tg3_probe_ncsi() returned
early because TG3_APE_SEG_SIG did not match APE_SEG_SIG_MAGIC or
APE_FW_STATUS_READY was not set. Isn't the real problem "no APE
firmware is present or ready", rather than something specific to
5719/5720?

With this change only 5719/5720 are skipped. Other ENABLE_APE parts
such as 5717/5718, 5725, 5761, 5762 and 57764/57767/57787 may have no
management firmware. On those, tg3_read_dash_ver() will still read
TG3_APE_FW_VERSION out of uninitialized APE shared memory. It then
appends a bogus DASH or SMASH version to tp->fw_ver, and ethtool -i
reports that.

Before 165f4d1cb3d7 ("tg3: Fix the setting of the APE_HAS_NCSI
flag"), tg3_read_dash_ver() did the signature and ready checks
itself. tg3_ape_scratchpad_read() and tg3_ape_send_event() still do
them before touching APE shared memory.

Could tg3_probe_ncsi() instead report whether valid, ready APE
firmware was found? tg3_read_fw_ver() would then only call
tg3_read_dash_ver() in that case. Or is there a reason 5719/5720
need to be special cased even when the APE signature and ready bit
look valid?

Separately, ecc796486f0a ("tg3: Detect APE firmware types") still
had those guards in tg3_read_dash_ver(). So it does not look like
the commit that introduced this. Should the Fixes tag point at
165f4d1cb3d7 instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111123917.910416-1-pavan.chebbi%40broadcom.com
