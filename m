Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521261;
	b=p8I2IKDCQsQ/QbBDMxTy38AzgelcfzMW1nQj8pnK5tCIKW3YXtiqWZnVlyVX7XGYMFJX
	 7MYSnGIHjLeV1uTEuh30YcLGupVVZosUb1ccTkqd63/2ittAsFyCAM/irswHLEqjBjjWe
	 7jU9mFo6ckv4VnW7UCD+HQo8q5ung2vcrjuuQMIFJUEcquZfpew7DwENOQFER5ybqAko/
	 mzq5LAHCCaUOwr7+OmxP/+PPOWRc87WPQfZ/cCCWqartCewRirH8+Zk3QDSFKCE/F48NS
	 7C7cTyVL6pNO4DkLZjdk0eFhpaWDoP2OvYEq5a7TmoScV5x6K4KolJu+9PlIv7iCXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521261;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=5z2ZLB6LGpnYC7gHMcEPo7+znCPfMIHxbLDX8r/bzlc=;
	b=5Niu+aFQMiUmPyyR813Fx3J0r3rpTFxFqd7i+gkz3bk1SsMJgD13BOTpuGlzoRj0Oe6s
	 7PD6Yz4150K0Y0ysDI2J/dgsYGmokzr87tHUQfYBtUs+Wo8mJ/C/ykaP+yf+00fU1pz/c
	 SG6vcOIXqkzCM0kLmm0Y5Sj2sEXH054lgNvdkepez1VdNvwEXjG6IGF9Ko3CJQhw5sJBR
	 KiS7rjTA+e4Bvs1hleV0+Kee0PE3eFUDKbT2Wl3JJK48Axf6B0WRfqeFx6VEd/oqX/9xd
	 LApxCgeW9IHXSpg/qnhz6EkBMWztqqRDm4h5HXZ9oLO8PSsQ6fiaIazsBE6wEn1SffQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9bRIz2x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E68606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9bRIz2x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C6E1F000C4;
	Tue, 24 Nov 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521260;
	bh=5z2ZLB6LGpnYC7gHMcEPo7+znCPfMIHxbLDX8r/bzlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9bRIz2xr4e78AVBWAWE9dMYYV5lXFg5AboPK6Xe9vYWUszbP83/s4cid4cVEsSA0
	 HgwWVo7xVo3fQrE/00VH+afWcJ75E/7xriOOwlXqZceCGcMjm5Jl5e4oi8/MbeMvbu
	 DWZvSdtcOCvFhXRqpIMmf4UbI+Bky4XY8wZSPqC0cBrQUN4mA24QVtlixVj9NZqEdB
	 ZJsh4hzodb8kdKpcYC5AcI6tQWS1+PAgETfcBjaGC+skCXIo2MKKu2PI7ZHyP/FTpL
	 U44NpWFzdwdS2MSbWzYl95I0fp98Oq/B33rZBSYcnbJv9b09rMIs5ubLJUPQq3fn4K
	 lM4aqtCMJkjxA==
Date: Tue, 24 Nov 2026 11:54:15 +0000
From: Simon Horman <horms@kernel.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	kuba@kernel.org, andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	shravya.k-n@broadcom.com
Subject: Re: [PATCH net v3 3/3] tg3: Fix heap overflow in unbuffered NVRAM
 write path
Message-ID: <20261124115415.GM31322@horms.kernel.org>
References: <20261118105408.1076095-4-pavan.chebbi@broadcom.com>
 <179534562327.3135.6438737872601204289@kernel.org>
 <CALs4sv1iZrM29XeJ7b=veiC1XdT=xo0wBxYm1z4PLWiOAC5N2w@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs4sv1iZrM29XeJ7b=veiC1XdT=xo0wBxYm1z4PLWiOAC5N2w@mail.gmail.com>

On Sun, Nov 22, 2026 at 05:13:51PM +0530, Pavan Chebbi wrote:
> On Sun, Nov 22, 2026 at 4:37 PM <netdev-bot+sashiko@kernel.org> wrote:

...

> Yes, ethtool -E will now fail with -EINVAL on 5750/5780 boards with SST
> flash, since SST_25VF0X0_PAGE_SIZE is 4098.  But the unbuffered path
> cannot work correctly with a non power of two page size.  With pagemask as
> 0x1001, phy_addr is not always page aligned, the read loop runs to
> j = 4096 and writes 4 bytes at tmp + 4096 of a 4098 byte kmalloc buffer,
> which KASAN reports as out of bounds, the program loop then programs 4100
> bytes, and NVRAM_CMD_LAST is never set because pagesize - 4 is 4094. I
> have no such board to test, so I cannot say how these writes behaved
> in practice,
> but refusing them looks better than erasing a sector and programming past it.
> 
> Also I would rather not change the constant to 4096 in this patch.  That
> would enable the unbuffered erase and program sequence on SST parts for
> the first time, and I cannot validate it on hardware.

Reviewed-by: Simon Horman <horms@kernel.org>

