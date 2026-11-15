Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747525;
	b=Gkhasg1/kdDt8JBmUCqROKuVRq+O8uX7a5QleJKM4Qj/EL/9SRiPTqUF32VKKTAYO6ja
	 uz73eiLHdTkyl5kRvMl9dsGkkk5EqGWRsF/mtWHT6I99vOY6upI7O7gByFndM4yNIqHN9
	 FIhFi39w2hw0EzgEk37/fz6t4M1zOxZ/1SpuXi+GD2f9oq0UhVcF+FxlNpVBZN6upYYjT
	 d6ve0tFlDyknV2yag/bLF7NnHvpKAdB/KIIlahaorpKrWXGq1dGNFEB7Kz9iUtJLet7pE
	 C6cy2JbAUt7RBebHUHIb5v+SqS6RiZB1lCiguwbBCqypwpjC9j0kYwRD8oQYiXI+B4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747525;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=N6EIGi9uZKoaTtDlMNwSbyiAbehWcQ2JqSuseeYMfMc=;
	b=wkGTZOeJc3hoE7foTHzVrw5zstkdHBZPgiJxPIK1Ov+FFEimCJZxsE+0BR+rLl9yH3nL
	 3XBuFuHdFAa88GkqhnTx5rRVskhYYcB6xO/wo7anMimVljSv46Wu5LA1dHAGof1C5XVC/
	 UTQ3EOGzNS5vPG5HV9LYBGKa+5qq26tyqBwO/JqpQ42um6ckojL5dBxHJpdI6YKRlYKoi
	 2iS8xdZ7nPWXKjDyoqXw30iVu3QZuCCFGPZevRuZni9EYFv680KqoNAEY5mwHBEFvpUOH
	 vVjIiIaSdl+06+gngT6lFkXN2O4ruP8jyKLOHLjAKx5ggqEtJt0XQckqPa5rjWCHssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN7jx1r0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF8606A331
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN7jx1r0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B7D1F000C5;
	Sun, 15 Nov 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747525;
	bh=N6EIGi9uZKoaTtDlMNwSbyiAbehWcQ2JqSuseeYMfMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lN7jx1r0EHz8pp2jGomdo5Py59nSfUR6y1Zl4vb8WnrWi/b7J2YktgF7B45jyFzTP
	 cJ1cjeQrbauNxu47H+bb799c8dTNqUsYCWcEp56M6TV6khh1yujvGnwZiCGjY9jEpZ
	 8phSm2cXebljqkss0Lqf503mp2uARdDa6+ajjxXhy5aDCn7OIKKBPSLFc5dcdwlRKU
	 i6fkhZq6P9Hy4iNzB/60j1wPN6S76mxVXhVuAo1nxRfyRLtls5Y6GyvH7mYqIF+H6H
	 MM3FawHVrcPFq+RuVZAafwsb4OWHgHFH41NlrS9WdzRVAdg7h5Z86BSyP3ClrKJtaK
	 youzqbLlHzSbQ==
Subject:
 Re: [PATCH net v2 4/4] tg3: Fix heap overflow in unbuffered NVRAM write path
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com,
 vishvambar.panth-s@broadcom.com
Date: Sun, 15 Nov 2026 12:58:44 +0000
Message-ID: <179474752435.2199510.4293749857887312550@kernel.org>
In-Reply-To: <20261111123917.910416-5-pavan.chebbi@broadcom.com>
References: <20261111123917.910416-5-pavan.chebbi@broadcom.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not fully fix the bug class it names ("heap
  overflow in unbuffered NVRAM write path"), and on SST flash its new…
- [Low] The commit message presents the new `if (!pagesize) return
  -EINVAL;` check in tg3_nvram_write_block_unbuffered() only as a guard…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but in
  tg3_nvram_write_block_unbuffered() the first WREN, the ERASE and the…

--

tg3: Fix heap overflow in unbuffered NVRAM write path

This patch clamps the copy size in tg3_nvram_write_block_unbuffered() to
the room left in the current NVRAM page, and advances buf on every
iteration. It also rejects a zero nvram_pagesize before the new size
calculation.

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 4becd1a0b0092..7558f4f164acf 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -3379,6 +3379,9 @@ static int tg3_nvram_write_block_unbuffered(struct tg3 *tp, u32 offset, u32 len,
>  	u32 nvram_cmd;
>  	u8 *tmp;
>  
> +	if (!pagesize)
> +		return -EINVAL;
> +

[Severity: Low]

The commit message describes this check only as a guard for the new
calculation:

  "Reject a zero nvram_pagesize, which would otherwise make the new size
  calculation wrap."

The check also ends an endless loop that existed before this patch.

The vendor switch in tg3_get_nvram_info() has no default case. That means
nvram_pagesize can stay 0 while FLASH is set and NVRAM_BUFFERED is not,
so writes go to the unbuffered path.

Before this patch, with pagesize == 0:

- pagemask is 0xffffffff.
- kmalloc(0) returns ZERO_SIZE_PTR, not NULL.
- phy_addr is 0 and the read and program loops don't run.
- size is 0, so len never decreases.
- offset = offset + (0 - page_off) sets offset back to 0.

Each iteration then issues WREN plus an ERASE at NVRAM address 0. The
loop ends only if tg3_nvram_exec_cmd() times out, and it runs with
rtnl_lock and the NVRAM lock held.

With this patch, ethtool -E returns -EINVAL instead. Could the commit
message say so, to help with stable and backport triage?

>  	tmp = kmalloc(pagesize, GFP_KERNEL);
>  	if (tmp == NULL)
>  		return -ENOMEM;
> @@ -3399,13 +3402,14 @@ static int tg3_nvram_write_block_unbuffered(struct tg3 *tp, u32 offset, u32 len,
>  			break;
>  
>  		page_off = offset & pagemask;
> -		size = pagesize;
> +		size = pagesize - page_off;

[Severity: High]

Does this still overflow tmp[] when nvram_pagesize is not a power of two?

The new check rejects only zero. On 5750 and 5780 class parts with SST
flash, tg3_get_nvram_info() sets a 4098 byte page size:

drivers/net/ethernet/broadcom/tg3.h:
#define SST_25VF0X0_PAGE_SIZE		4098

drivers/net/ethernet/broadcom/tg3.c:tg3_get_nvram_info() {
    ...
		case FLASH_VENDOR_SST_SMALL:
		case FLASH_VENDOR_SST_LARGE:
			tp->nvram_jedecnum = JEDEC_SST;
			tp->nvram_pagesize = SST_25VF0X0_PAGE_SIZE;
			break;
    ...
}

NVRAM_BUFFERED is not set there, and FLASH comes from
NVRAM_CFG1_FLASHIF_ENAB. So tg3_set_eeprom()->tg3_nvram_write_block()
sends these writes to tg3_nvram_write_block_unbuffered().

With pagesize 4098, tmp comes from kmalloc(4098). The read-back loop
steps by 4 and reaches j = 4096:

	for (j = 0; j < pagesize; j += 4) {
		ret = tg3_nvram_read_be32(tp, phy_addr + j,
					  (__be32 *) (tmp + j));

That stores 4 bytes at tmp + 4096, which is 2 bytes past the allocation.
The program loop later reads the same 2 bytes and writes them to flash.

pagemask is 0x1001, which isn't a valid mask. Offsets are dword aligned,
so page_off is either 0 or 0x1000, and phy_addr = offset & ~0x1001 is not
sector aligned.

When page_off is 0x1000, the new clamp gives size = 2, so len, buf and
offset each advance by only 2 bytes.

For example, take an 8192 byte write at offset 0. The first iteration
copies 4098 bytes. About 2047 more iterations follow, and each one erases
and reprograms a full page at phy_addr 2, 4, 6, and so on. All of those
addresses are inside sector 0, so the data written by the first iteration
is erased again.

Even a 4 byte write at offset 0x1000 erases and rewrites sector 0, because
phy_addr is 0 there.

The NVRAM_CMD_LAST check in the program loop can never match either:

			else if (j == (pagesize - 4))
				nvram_cmd |= NVRAM_CMD_LAST;

j steps by 4 and pagesize - 4 is 4094.

The commit message says multi-page and unaligned writes are now correct.
Should the fix also change SST_25VF0X0_PAGE_SIZE to 4096, or reject a
pagesize that fails is_power_of_2() or is not a multiple of 4, instead of
rejecting only zero?

>  		if (len < size)
>  			size = len;
>  
>  		len -= size;
>  
>  		memcpy(tmp + page_off, buf, size);
> +		buf += size;
>  
>  		offset = offset + (pagesize - page_off);
>  

[Severity: Medium]

This isn't a bug introduced by this patch, but the erase sequence just
below in tg3_nvram_write_block_unbuffered() drops errors:

drivers/net/ethernet/broadcom/tg3.c:tg3_nvram_write_block_unbuffered() {
    ...
		nvram_cmd = NVRAM_CMD_WREN | NVRAM_CMD_GO | NVRAM_CMD_DONE;

		if (tg3_nvram_exec_cmd(tp, nvram_cmd))
			break;

		/* Erase the target page */
		tw32(NVRAM_ADDR, phy_addr);

		nvram_cmd = NVRAM_CMD_GO | NVRAM_CMD_DONE | NVRAM_CMD_WR |
			NVRAM_CMD_FIRST | NVRAM_CMD_LAST | NVRAM_CMD_ERASE;

		if (tg3_nvram_exec_cmd(tp, nvram_cmd))
			break;

		/* Issue another write enable to start the write. */
		nvram_cmd = NVRAM_CMD_WREN | NVRAM_CMD_GO | NVRAM_CMD_DONE;

		if (tg3_nvram_exec_cmd(tp, nvram_cmd))
			break;
    ...
}

The -EBUSY from tg3_nvram_exec_cmd() is never stored in ret. At this
point ret is 0, because the read-back loop just succeeded.

Suppose the ERASE completes but the second WREN times out. The page is
left erased and is never reprogrammed. Will the function still return 0,
so that tg3_set_eeprom() and ethtool -E report success?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111123917.910416-1-pavan.chebbi%40broadcom.com
