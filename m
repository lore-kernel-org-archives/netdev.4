Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345624;
	b=MPwWV20L4JJiNVTKtPLHI4fuwhpThxL30wt8CBO1bEzuW2ZtwuPsSs5rxFs36a43GNN2
	 1HRKCNgIMpT9ZzLvmqou3tsWP0L6CqqVo67sQYIwX1HtKsZzFJcBxnKwIzsVpsqsO61y1
	 kdMvYcUQZ8VWHTyvXyCcZeuaaIxQKzVKo0MgZwh2JBRCoPv1uRtuCM0RnqJsvOBMG8zlI
	 Zxkux5goNm7Ln9ESeC69XxA3xewNnsCICXnBRwanM/9c/Vev7HEz2256b5bdhmbS+ES5q
	 rLLUjyZlpnE8yQPv2BjIRruqXktwMkCsxaJDRUFtH6l/6Blz3TBG73UlssHzAOhqgbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345624;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zUKT31+fsFikHOky0ekP/ZplaKlU9TPjOWWiMxjY2Uw=;
	b=isrpmG1JquP2XQWMyaE4eu251IlLaVyzph/I7prq0IcaVZYiVC9cN7bU6FOPmzUHGCQS
	 ZDaiRX/RhXnakXGycclhySBXsnKJrBzu1ngpFB+hk+Owegyuuq5hIk1AmOowodv01mGSf
	 ZCwoNvA5EfJE5l04q/IfHpYq3JHZGDVxAF+jfL6giXhJ1r96fr/yCbuqgb9A4wQMRT57w
	 vm+OQwYyGYglSnNcGAh7g7xcVTgUTaGZUYrYawABLqiCVpwU4qxOIy3OTY+A344d6b45C
	 yfIRaWITcIdcif8QwkH/0TRg4+PpX7tT+TUPdCX5r5bAqenMHzWIAr5mhhOKyvLkU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjZDLg+R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0A606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjZDLg+R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3BA1F000C0;
	Sun, 22 Nov 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345624;
	bh=zUKT31+fsFikHOky0ekP/ZplaKlU9TPjOWWiMxjY2Uw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NjZDLg+RQcm61B+JYBmVExpTSCsR7dMc0g0Su7LcjYUrMmBP8NhIrMWwfTYuIGGLy
	 oU4+CBfe/8WT4k/vDDqu7+7+bIhuxmu/a6ZfjIMOwaTMxgXXyO981auCFaIPDXesfV
	 mYDZKSZjr6YF182HsyliZjGuno8bdyQmWwYQkqnoxtrUCLR3Pz653SBlo9HzCR2GVE
	 D7tjyOp9Uy6UjBJQ3k8FKGF8rB7/lc7MEb+6CWSl48np9ahha0jTYzMcpJj9ISjTaM
	 tU1PQLluhQal5xtFiQqDbdJZ8R7sLAs67S/cCbI3UO/CuLA+wGhzEjeEBuBuhOb7Y1
	 R31ZRU38Bfi2Q==
Subject:
 Re: [PATCH net v3 3/3] tg3: Fix heap overflow in unbuffered NVRAM write path
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com
Date: Sun, 22 Nov 2026 11:07:03 +0000
Message-ID: <179534562327.3135.6438737872601204289@kernel.org>
In-Reply-To: <20261118105408.1076095-4-pavan.chebbi@broadcom.com>
References: <20261118105408.1076095-4-pavan.chebbi@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new guard `if (pagesize < 4 || !is_power_of_2(pagesize))
  return -EINVAL;` in tg3_nvram_write_block_unbuffered()…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch only
  partly closes it.

--

tg3: Fix heap overflow in unbuffered NVRAM write path

This patch changes tg3_nvram_write_block_unbuffered() to clamp the copy
size to the room left in the current page and to advance buf on each
iteration. It also rejects an nvram_pagesize that is smaller than 4 or
not a power of two, so ethtool -E fails with -EINVAL in those cases.

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 5a0e247a4c463..12f199355984b 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c

[ ... ]

> @@ -3379,6 +3380,9 @@ static int tg3_nvram_write_block_unbuffered(struct tg3 *tp, u32 offset, u32 len,
>  	u32 nvram_cmd;
>  	u8 *tmp;
>  
> +	if (pagesize < 4 || !is_power_of_2(pagesize))
> +		return -EINVAL;
> +

[Severity: Medium]
Will this check reject every NVRAM write on 5750/5780 boards that use SST
flash?

tg3_get_nvram_info() sets up the SST parts without NVRAM_BUFFERED:

drivers/net/ethernet/broadcom/tg3.c:tg3_get_nvram_info() {
    ...
		case FLASH_VENDOR_SST_SMALL:
		case FLASH_VENDOR_SST_LARGE:
			tp->nvram_jedecnum = JEDEC_SST;
			tp->nvram_pagesize = SST_25VF0X0_PAGE_SIZE;
			break;
    ...
}

The constant is defined in tg3.h as:

#define SST_25VF0X0_PAGE_SIZE		4098

FLASH is set from NVRAM_CFG1_FLASHIF_ENAB. Because of that,
tg3_nvram_write_block() sends these devices down the unbuffered path:

	if (tg3_flag(tp, NVRAM_BUFFERED) || !tg3_flag(tp, FLASH)) {
		ret = tg3_nvram_write_block_buffered(tp, offset, len,
			buf);
	} else {
		/* unbuffered writer */

is_power_of_2(4098) is false. So tg3_set_eeprom() -> tg3_nvram_write_block()
-> tg3_nvram_write_block_unbuffered() returns -EINVAL every time.

The value 4098 looks like a typo for 4096, since SST25VF0x0 parts use
4 KiB sectors. Before this patch these boards were already broken: pagemask
was 0x1001, and the read loop wrote 4 bytes at tmp + 4096 into a 4098 byte
buffer. The new check stops that overflow, but it does so by refusing the
write rather than fixing the page size.

The commit message says:

    A page size of 0, which tg3_get_nvram_info() leaves unset for
    an unhandled flash vendor, also made the loop issue erase commands at
    address 0 forever with the rtnl and NVRAM locks held.  ethtool -E now
    fails with -EINVAL in these cases.

It does not say that a flash vendor the driver supports now always fails.

Should SST_25VF0X0_PAGE_SIZE be changed to 4096 as part of this fix? If
not, could the commit message mention the SST case for maintainers and
stable backporters?

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but the
unset page size case named in the commit message is only partly covered.
The new check only exists in the unbuffered writer.
tg3_nvram_write_block_buffered() still divides by the page size without
checking it:

drivers/net/ethernet/broadcom/tg3.c:tg3_nvram_write_block_buffered() {
    ...
		page_off = offset % tp->nvram_pagesize;
    ...
}

tg3_nvram_write_block() takes this path whenever FLASH is clear.

The vendor switches in tg3_get_5755_nvram_info(), tg3_get_5787_nvram_info()
and tg3_get_5761_nvram_info() have no default case, and FLASH is only set
inside matched cases. tg3_get_nvram_info() on 5750/5780 class parts is the
same when NVRAM_CFG1_FLASHIF_ENAB is clear and the vendor does not match.
In all of these cases nvram_pagesize stays 0 and FLASH stays clear.

tg3_get_nvram_size() still sets nvram_size, so ethtool_set_eeprom() passes
its length checks. The call chain is then:

tg3_set_eeprom()
  tg3_nvram_write_block()
    tg3_nvram_write_block_buffered()
      offset % 0

Can this hit a divide error oops while rtnl and the NVRAM lock are held?
If so, would it make sense to do the same page size check in
tg3_nvram_write_block() so that both writers are covered?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118105408.1076095-1-pavan.chebbi%40broadcom.com
