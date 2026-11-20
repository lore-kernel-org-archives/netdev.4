Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186047;
	b=DxGtT9F8jYfvBKql8pxxKVkSe4cexljzWQw24kU8h6nTigohYj3qz5OTBOGrmLauYhE2
	 CJqv6NLd5A3zIRy51OUEp7WKz0KpZdt8honhz/z2UDNhEXUN71gFsFHBpWq9H7Nj63Pol
	 3Xoux+PmkBQvmtj6N10M3AaN9OlArdsBkPbTU6MuhE1XykK57hU1O0zs7VkkcT4EF+Y5X
	 5i3DOeE4O0oW/kY0hzXhsnpSkHo8j6uuqkvJdNGfb4Piq2e32lAaTqnwP7JxPquYpBQMY
	 KjV58X54pUyyS5krif2Mk3ZRf0DTabWNdkJpiBx8OtUJCKhkHCf8DZl8o7L6hEaJ9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186047;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Content-Type:Content-Transfer-Encoding;
	bh=7lDtZ3hGN9b/G+u+R6RW+gOmPSbNNpP4+cp9diJUF44=;
	b=0ggHSgtUhqHL8gSfZu/K7g6J21rEZZC+pOLacxjYUuImkmlUMzZiwVx7z/QmaoECn9/L
	 wmCKqXa4ELHD/n6AqtpNWilYZA9E/n0gYIEf0L3ApTXuyhwG6+Z3Jp0TuDT8PmsZcoDH6
	 O2VQWZMJVl/a7d00GpB4lwfcFEZx6Ikh6Dzxz2mo8fzK8YHVR56wX2xoL2WpStqDcWdqz
	 iH61PZ/v6JXbtgOAx1p7YeZKOc+LAZwRnWkipq4pOVHWrqX31LSRSZJEoklVoFOs1UrRH
	 j+zsnHP0lliVecSxWIKksN1MBkdfU12ns29FEOyYAJbRomIAPiLredkqL4CRa+6/JOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=WMddph2n;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C3606A326;
	Fri, 20 Nov 2026 14:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=WMddph2n
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CE9A180489;
	Fri, 20 Nov 2026 15:47:25 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73qYHBJgtuIa; Fri, 20 Nov 2026 15:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795186044; bh=p4wlwrOxllXj04UsD2WxdhJIRf9fiYXFmoCz4Fpl6a0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WMddph2nrb2s3I/T0hD9n7ZhDlnuEToadvNgL85j7KrwFAUhPO/091e4b1EJa0YGd
	 FEoN6b7rlnA/gIIKD5K2L5IvxqgXBRr/iIVGL2NU2p2+sar7/1n1uwUkcBaRGVOH/h
	 21yY9N9EEBO24tOdkMn7pQO9adKKMIKnHfGZK2zmvS1MJhfxtvCjoWfRHDWJ7nUvc3
	 hJzDtbjDdutcZUJhiOeSV/54L02rDQKsfO6BQ8f5m+ON5o3S4XXdZgohFLhNyYed41
	 Qq4XJ88GjLGhtnC3DSfvemg/SoUQagoOdtddepkuYQbUKp10z8tkKZxoX35Sf0K8md
	 B0+iepISaYzPQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 14:47:24 +0000
From: Rustam Adilov <adilov@disroot.org>
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Linus Walleij <linusw@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Taiga Ogawa
 <zectaiga@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: tag_rtl8_4: add support for RTL9607C
 tag variant
In-Reply-To: <awA2z07l0ZvzcWtc@analog.com>
References: <20261119165129.26693-1-adilov@disroot.org>
 <awA2z07l0ZvzcWtc@analog.com>
Message-ID: <b1cd757ad411aa74cb2934ccea0924e0@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello!
On 2026-11-20 12:09, Alvin Šipraga wrote:
> On Thu, Nov 19, 2026 at 09:50:51PM +0500, Rustam Adilov wrote:
>> The RTL9607C family of SoCs have an embdedded switch that utilizes
>> the same Realtek CPU Tag protocol 4 with 8 bytes in size but have
>> a bit different of a layout. And that layout is also different for
>> TX versus RX sides and introduces new fields not seen by RTL8_4.
>> 
>> Add basic necessities for this cpu tag variant to function.
>> 
>> Tested-by: Taiga Ogawa <zectaiga@gmail.com>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
>> Tested on OpenWrt with 6.18 kernel version [1].
> 
> Mainline doesn't have the requisite DSA driver to make use of this
> protocol. Andrew, is it normal to accept tag protocol drivers without
> the corresponding DSA driver?

I suppose that is fair. I guess that also means i need to hold on to
the PHY support patches until then too?

> I can see that the OpenWRT kernel has a DSA driver using it. Why not
> submit that together with this? Otherwise it is kind of dead code IMO.

Yeah but right now it is not upstream ready yet. Ideally i would like it to
merge with rtl8365mb dsa driver cause by all accounts the embedded switch in
RTL9607C is very much like rtl8365mb but connected over MMIO. So that is my
overall plan.

I am already working on making the downstream dsa driver follow the rtl8365mb
in every case, mdio [1], irq [2], mdb plus vlan [3] but it is kinda messy as
VLAN side is very much like family D which is still being worked so nothing
concrete yet... and the table part is currently being provided by downstream
otto-table driver but we could just as well copy rtl8365mb_table in process.

After then introduce something like realtek-mmio (similar to realtek-mdio
and realtek-smi) and bam, we can straight up share the rtl83xx code :)

But maybe i should really jump straight to it and not slowly converting
the downstream dsa first (which wouldn't really be relevant anyway?).
If it turns that i do need DSA for this be also accepted then maybe.

> As a side note, it's unfortunate that Realtek recycles
> EtherType/protocol ID values for seemingly different formats. At first I
> thought this should be its own file/module, but I can see why you put it
> here. My one concern would be whether the semantics for the common
> fields are actually the same for both protocols? If not then maybe it's
> better to separate them after all to avoid confusion.

They do share the same semantics except reason part as its numbering seems
to be a bit different, 80 is reserved, 0 is normal forward. More documented
by the RTL9607C CPU NIC Application Note at [4] and the hwnat driver [5]

Anyways, thanks for review! I partially also wanted to announce our presence
to rtl8365mb folks by this patch as we may share the space soon :)

[1] https://github.com/openwrt/openwrt/pull/26779
[2] https://github.com/openwrt/openwrt/pull/26593
[3] https://github.com/openwrt/openwrt/pull/26415
[4] https://github.com/jameywine/realtek-doc/blob/main/datasheets/RTL9607C%20CPU%20NIC%20Application%20Note.pdf
[5] https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/drivers/net/ethernet/realtek/rtl86900/FleetConntrackDriver/include/rtk_fc_mgrTRx.h#L540

>> The RTL8_4AP name was mostly chosen because Realtek gave the RTL9607C
>> family of SoCs a codename "ApolloPro" in their SDK, hence "AP" part.
>> Originally it was named RTL8_4_RTL9607C but that feels weird.
>> 
>> [1] https://github.com/openwrt/openwrt/pull/26496
>> ---
>>  include/net/dsa.h    |   2 +
>>  net/dsa/tag_rtl8_4.c | 193 ++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 194 insertions(+), 1 deletion(-)
> 
> Kind regards,
> Alvin

Best,
Rustam
