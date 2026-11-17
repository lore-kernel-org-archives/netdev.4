Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879747;
	b=XHqBY51M30RPvcdnLVryMdb6B4LpCtHAf1pgURK7peP9TIvB793SnBZ5LmlIdUlo3ZgU
	 Pop6NCGq2Zx9AOFsTzoj64WyWPyM6I5OAo4CA7qVuL0toBguqdHow+uKzgBiXB4aO6UZK
	 CIGnCRUYM51SaipR4BQ62npnWAS6RQOriOWB6lnpOKRIB3Y2OyCaDq2vyNvlL88I/v4Tj
	 xdhXBeUdmMIE+fr7DDVa1K75Lne8Mrf1OZs/C+2I2FHw47LgulBs0wvLhYvpFVZVLQgHX
	 gBCMxO2C8hDNnCDRGS0yPs3cXExI3nhbHESEBR5i9S2nKX7sHHxvyTTzk3E2IlEEbeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879747;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2qcJKNUTkGRZCr2oq+EUfBGTGp5J3/etKeRpOPwjgBU=;
	b=EfmnP8ioZ9AWaM/5VS0wSbcPLrnODieQIQiAtA3B+jT0WtAsLOBEQW+gi1lxKvjAiSWC
	 QmlxMXKffEgIHWjy6pfzd5ADHRP0M33kP93wGD6ThmmW0cxo5NaQaBSFaVWChtsTPFxkP
	 OfuPzl1RvPQdEMew3fTzqoKoPXI9GSxxJ6Yvtyw6WnCeFlzDGUE+da7pXuK3a1AFYP8ja
	 zTIhn+a6WWFHCBJn6X+egw+MbpUzoCYJYkXlYnhdhUf3YpsC93Iot7t2KFt/epfqkrNoV
	 LMHdvOjFPO1m03h4TwRfjZ+F1JuRgYeaLAnfq2O/WbpH1hPaR5ZZfqs5sxntRE5vuig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEjDeXZt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB3606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEjDeXZt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101DF1F000C4;
	Tue, 17 Nov 2026 01:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879747;
	bh=2qcJKNUTkGRZCr2oq+EUfBGTGp5J3/etKeRpOPwjgBU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LEjDeXZt7eQYEuuM1ubpwQ0N6SSeipR+V1OQXZYkso4dpkBIw+mF7uHgLiiJo++9V
	 XHtRdnhWQVb9w0IhQdBI+yHwi0Lhg+LeUNVkKzjKWXkF/6F22xTZ4ApAfh93ntjaYX
	 gHU8SeDtEs1mbBN6vZGNFRvTWBId2IhHZ6z7+DW55RbxITVrb3ioznp1EZU+Vl8zqT
	 0sMWJOCKeZA6rnXCl9q8dye5lXBCh/I2NxmMAYCD6OQ3+mS1yULS0cS7skWoa4Pod0
	 1Nh8qWRHq3sHFNWgy/7FP20PjHzIRgd+ZOgS0awZBayClRilH0kp1u0mTEmkZqUbnI
	 6P7blZrtQxjzA==
Date: Mon, 16 Nov 2026 17:42:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
 ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Subject: Re: [PATCH net-next v8 00/15] ibmveth: Add multi-queue RX support
Message-ID: <20261116174225.7d9e9611@kernel.org>
In-Reply-To: <20261109235556.60604-1-mmc@linux.ibm.com>
References: <20261109235556.60604-1-mmc@linux.ibm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 15:55:41 -0800 Mingming Cao wrote:
>  arch/powerpc/include/asm/hvcall.h   |    6 +-
>  drivers/net/ethernet/ibm/ibmveth.c  | 5007 ++++++++++++++++++++++-----
>  drivers/net/ethernet/ibm/ibmveth.h  |  240 +-
>  tools/perf/python/powerpc-hcalls.py |    4 +
>  4 files changed, 4318 insertions(+), 939 deletions(-)

This is way too large, I spent half an hour reviewing and only gotten
to patch 8. There's no reason for the series to be this big. The 15
patch limit doesn't mean you should try to cram as much as you can into
15 patches. Please split this up into (3?) smaller series.
-- 
pw-bot: cr
