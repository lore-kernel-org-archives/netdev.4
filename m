Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660017;
	b=V7Gh1DkO95hv6avyv6u1zyYEw8TKA9Ptp/R7Ieu4WsAhSjz5oOCQeCsnCD27uWjgbl2Z
	 K+eTWsA+Zb2kmPzuMqGy51VNyAShYnUg8EHJLAH9NqLV4ftFvuGdJAqYAkBtcjV63ft+1
	 WWFaha2AsyAxLXipE41Bb3k914Y9TPjdJy7ITB7h41zWBkQm/KtQAHnwHx62PaoHLzOpF
	 sWEDw4UKN3s7h3Xixx055R9xgnRYOYCen0DcaY9/gaGSbNIwHZX2F/3pkXNx8lgBNHwoY
	 DouzmzCqwq/0cKkfbCxpPkBRIUu2n0lB+3Q1+vwBk6y2um/2RwOm7aQo59x87LcIkPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
	b=fPAaIB9z32ROR6Q8zru7tkAbRHPU3+x8DEtuq9OpjvuE8kUqn0JquvO51t5NTdsrOm9E
	 beT1cwX1IJxK1hUEvl1zqCiNtQTduBgMGOy2bl1iga2Lsa8PRVx/fZyUZdFTcRq4pB0m0
	 Sd9MnZoc9ZCynNd6/PCbnth7tkmC7cMUmjnStqTBmcZRxNouI+WLBA3UUbTMSrOkx+zJS
	 EkXMxBJP0gpkeQEc+tCc5Z2aNdzn+efnlbokA0jyxuaLR8utfXwefJXvi/TJd2HSa7ac9
	 vnc2FQVbPKbWdk5Awgq6+1roPWC5IP+GxsSnUMxxERP4jfkSFOegs4jnc8ifRmLjQlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=f00LtqH3;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5C606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B5C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=f00LtqH3
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4AFE53FE38
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795660014;
	bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=f00LtqH3q59SIz4jEhz/G7Xi2UaqG7ATPnX6nbQmtMBMQLmnwL1P6WmbfJcCxk3FR
	 H0NB4UsHCC4JI/rWDkLcZEba1tJbhPDY/wDsJt9cX12eb7OiRWCkQBnnL8G+alWmbt
	 YWnV1/nxW5EM8VBnyyGbGsdiT5QGiz3/do/I+teJp4vdkvK79wNYeAnI3Hh/FVwddz
	 TxtHcZEZO2Qcc1Cl6nCBNmhgy8vT0RkF76I1pY01naU0vffOM9D018CJerW6NAZGiY
	 gfQynXCKKeHovl13RlT10BtqCEl6PVZ7CwFHUG6q440tOgxhgoyLlFHezHYHepT0Kd
	 q6eLt90gs2yJ9u+VrjD5DXp3roQegOVX8cmk8uquw1zr8CTvCkBDHT8iLqWWY5wYTj
	 HS3emDEqp3fPDAR5WVQXGsoMy4IPoQX0lWrOH5MNeXk2GsliibsHaZKyTcSbEvAQ5S
	 lFp2RMr2boM3pxiFIY/RRFFGWQUfh/DoDjX8zoDSK0VnKCgp8sjfNk4L/VsF2PqXke
	 dsnKitFTCzN5cGMWuc+Jmrfns7Jerpq5Q1YIdgbCHiSSHySFpzFvU3r80nM26O9Odu
	 1FsO1sixDnxgjW9wK71h3ZZhac0lo+3YMKrEim/8K2Y41/KsLlsHnKxpvu/TiWat05
	 ZWMCH0X5f5giQB76eagC+PMg=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f05c68629cso42691525ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660012; x=1796264812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
        b=DXlROvLGV0WIfk7h9ipLCR1T3Hf/Mk5nOh1P7S01/4IfpFY/x2mDq00jHUbXTRpvjM
         iSfF+TgRHFBVt8NZQnHG4MA6Qo+bxMLkgPNFzO4A0sT1Ah6KvznlubYswkkB3HZ+cvof
         59nM7cYxvbEKP8s/QtdQqD1LlwT+6SYIVFAxQEKVpTIk/akfmVvkxXgwr1l7L1nL2seX
         QYiBA8XnB2wsuaSyhWq6uFlcrz3c2Px3weELcQIMaLaC4OES0oWD/zXjlEm4kFgjx14+
         tFKBDohjTWaa4iq7/Vh05e/SVFQz5PtU2cUlHovDE58rpfVAP/njXN+S/B5XFi6jKT8/
         PMxA==
X-Forwarded-Encrypted: i=1; AL+hErFSjw4k1aneSiLRTKvzKfLfrmUT8rO2po+yRQ83eQ+0FVnj5qoxnK0N7o72KPJXBqcBK6XoYCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C73dD2BdNJphrwKU8ZS4/IvmuLKVk9XTQ3+kr1JvOu3kxQJad
	3eXcu7mFHnMydPLqVXODamFkiUtPE5W3coyj3YbhOd6LpWjF72C6jbR/jSIEkhyWJpLTpm5LXxO
	oCTeIUxMoVOqgt44fH7vHJ0VYS6nTXPAh/fLD5AaEgrrhl1HFqGyaYFNTllgsXxyXAs5bXK374A
	==
X-Gm-Gg: AZFdTZdpcjXq/J/wIm1M/JPGiNu2KSJOUJtRAEpdl5YjXJauf+V5WlsTDweLEyq4TSk
	wnFSAW4l+xzOOtecDCYQAWuj0tSGULKqmV1jjX5ZAr2hmnWy25jkfi9shXTjnX2glzQXx82sIpc
	3CLUE6ucGQ37IB+sfErVsNhYwWhMcHf/Us3fOLSX6Jj7y528+dqS1kC6yqodoDcVCS8FnIwO2pj
	58u/DJAfIum/txf7/5CA44HoGKv08s3wTKx67r3aS4eQxEiWF5DA5xDWHwU1pFBASYRuoSYn2yc
	zjwOvEZYGU+sJvHQ3GWDSliPPDw/ko3fB/CuWhTVJ9RwUaNbtgKx7Y6Xyj66QIRsvOr4EKU+xmr
	uVo1BMF775w6fIXhnVeM6byb+Rd+eVIdwl0KxiAP3bNZQ5th7kkStsLQYIVEiAtEEv17k5WO5rx
	EWayPP+kCu8qV1Ofzzmv9ZaXdJixtM
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr192049515ad.41.1795660012470;
        Wed, 25 Nov 2026 18:26:52 -0800 (PST)
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr192049315ad.41.1795660012059;
        Wed, 25 Nov 2026 18:26:52 -0800 (PST)
Received: from acelan-Precision-5480 (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm95486895ad.7.2026.11.25.18.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:26:51 -0800 (PST)
Date: Thu, 26 Nov 2026 10:26:44 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Ye Shu <hello@shuye.dev>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] e1000e: disable K1 by default on more MTL+ systems
Message-ID: <aweXIb8RzSVHmTwT@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Ye Shu <hello@shuye.dev>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119001818.513503-1-acelan.kao@canonical.com>
 <20261124022233.1234651-1-acelan.kao@canonical.com>
 <087a9cf2-bd0a-4f57-8dcf-9b0962186fe1@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <087a9cf2-bd0a-4f57-8dcf-9b0962186fe1@intel.com>

On Wed, Nov 25, 2026 at 09:42:20AM +0200, Ruinskiy, Dima wrote:
> On 24/11/2026 4:22, Chia-Lin Kao (AceLan) wrote:
> > Like the Dell Pro 5 Micro P5M1260 added by the previous patch, other
> > systems with an I219 on MTL or later no longer enter S0ix during
> > s2idle since commit 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake").
> > Every suspend ends with:
> >
> >    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!! (S0ix cnt=0)
> >
> > Each unit ran 3 s2idle cycles on kernel 7.0 with the default K1
> > setting and, if all of them failed to reach SLP_S0, 3 more with
> > disable-k1 on. On the following systems the default cycles never
> > reached SLP_S0 and the disable-k1 cycles all did:
> >
> >    Dell Pro 14 PC14250                       [8086:550a, 57a0]
> >    Dell Pro 3 14 P314260                     [8086:57b3]
> >    Dell Pro 3 16 P316260                     [8086:57b3]
> >    Dell Pro 5 14 P514260                     [8086:57b3]
> >    Dell Pro 5 16 P516260                     [8086:57b3]
> >    Dell Pro Max 14 MC14250                   [8086:57a0]
> >    Dell Pro Max 16 MC16250                   [8086:550a]
> >    Dell Pro Precision 5 14 PW514261          [8086:57b3]
> >    Dell Pro Precision 5 14S PW514260         [8086:57b3]
> >    Dell Pro Precision 5 16S PW516260         [8086:57b3]
> >    Dell Pro Rugged 10 Tablet RA00260         [8086:550e]
> >    HP ZBook 8 G1i (14/16 inch)               [8086:57a0, 57a1]
> >    HP EliteBook 6 G1i (13.3/14 inch)         [8086:57a0]
> >    HP EliteDesk 8 Mini G2i                   [8086:57b3]
> >
> > Add these systems, matched by DMI vendor and product name, to
> > disable_k1_list so K1 is disabled by default. The HP entries match
> > the product family, which covers the screen size variants.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake")
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >   drivers/net/ethernet/intel/e1000e/netdev.c | 98 ++++++++++++++++++++++
> >   1 file changed, 98 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
> > index a8f0d3c0fd750..319c7a44f5a53 100644
> > --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> > +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> > @@ -80,6 +80,104 @@ static const struct dmi_system_id disable_k1_list[] = {
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 Micro P5M1260"),
> >   		},
> >   	},
> > +	{
> > +		.ident = "Dell Pro 14 PC14250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 14 PC14250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 3 14 P314260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 3 14 P314260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 3 16 P316260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 3 16 P316260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 5 14 P514260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 14 P514260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 5 16 P516260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 16 P516260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Max 14 MC14250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 14 MC14250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Max 16 MC16250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 16 MC16250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 14 PW514261",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 14 PW514261"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 14S PW514260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 14S PW514260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 16S PW516260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 16S PW516260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Rugged 10 Tablet RA00260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 10 Tablet RA00260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP ZBook 8 G1i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ZBook 8 G1i"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP EliteBook 6 G1i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 6 G1i"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP EliteDesk 8 Mini G2i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteDesk 8 Mini G2i"),
> > +		},
> > +	},
> >   	{}
> >   };
> Hi AceLan,
> Thank you for this investigation.
>
> With a list of systems this long, covering multiple generations, this
> suggests a fundamental problem somewhere, probably not what this quirk is
> intended to solve.
>
> Furthemore, as I said, I am not aware of the mechanism by which enabling K1
> can prevent SLP_S0, and the GBE_D3_STS as a blocker seems particularly
> strange.
>
> I have asked our internal validation team to investigate this, at priority.
> First I want to understand if this is limited to Dell/HP systems, and if so
> - why.
We have Dell and HP machines in the lab, so only systems from these
two brands have been verified.

We also have few Lenovo workstation/server here, but it looks like
they are not affected.
>
> I would rather hold this off for a bit, while we investigate. Though, if the
> investigation turns out complex, we may apply this patch, at least
> temporarily, until a better solution is found.
>
> --Dima
>
