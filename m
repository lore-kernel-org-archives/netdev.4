Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838144;
	b=CXv+UDwZRa7v+1YkVQ5CrkoGDY+NJrc4upBZIPaX/8KCwqWKSYsjVI+qaU9pG2603vXh
	 TkRCftGVBYgxZyaUYDHyxQo8VkC3ES1vcDe0cs9kg0v7j55EefzLtRdcgkapa+I96hOzJ
	 SGNnYsNKfemINt0zwDskRflbJRzUVphaLD7odoKwKfxxGHY3G7zBgKHx7OetW1PxeDCD1
	 AzHkeIWkmnlvUld1HXeClSky1I/jHkLXFvu4KRTyVHCjbTYoIaZTFg01/bW+Z8WODHxpj
	 /ecEILjS3LdLSD2URRTrv8Hy0WZhIbMD7t/mI5uKsJEstJIWoNUfpixQ76gZOi6kD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838144;
	h=DMARC-Filter:EX-QQ-RecipientCnt:X-QQ-GoodBg:X-BAN-DOWNLOAD:
	 X-BAN-SHARE:X-QQ-SSF:X-QQ-FEAT:X-QQ-BUSINESS-ORIGIN:
	 X-QQ-Originating-IP:X-Originating-IP:X-QQ-STYLE:X-QQ-mid:From:To:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:X-BIZMAIL-ID:
	 X-Address-Ticket:X-QQ-SENDSIZE:Received:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ff+YQwFQu2cglKeMT/Wacu//1hj0avlGTgfQzHh8Scc=;
	b=BhVT7TNUUgczN8AlwXI9pfyuuw/ZDEC4OTXrqJmaTw4hm+QF0/5aLW5aCpIkBkN6VFw+
	 k++VU6cstINsLOjN7SVbtMksxrte+4iS2ZHcGg2M/x9QNhywLiSdZiD6CE6hpJNbtKkvu
	 hSYc69Jwkwe8DkT14jKxllrMACVV9AFXWUfJ6rkbGY1qmRL3I3kYCX4FpI00ZmjQrfxoD
	 2himQS27s7PBTr9kWvWyNF/pv5yn830QNhQSGcbwdMW6dTJfh4/Z90R2us/59KFIS0dEj
	 C+5lAsdu2Oklvsv5kHroWc8+YoSHXXWuiGZkdHiSs4BURe9ufBbGTh21q73w53H2y/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=njupt.edu.cn;
	spf=pass smtp.mailfrom=njupt.edu.cn;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE9606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=njupt.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=njupt.edu.cn
EX-QQ-RecipientCnt: 1
X-QQ-GoodBg: 2
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqSZ+wywHNaAz69ewu3H9YUIm9UH61NklH8=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: a4x2PhlpE/oK8tXL7gE6JTnaZl872K8c+Nu8YYAL8ys=
X-QQ-STYLE: 
X-QQ-mid: lv3sz3b-5t1794838133t5f68cc92
From: "=?utf-8?B?5YiY6Ie06L+c?=" <1025040921@njupt.edu.cn>
To: "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>
Subject: Question about the right-edge check for zero-length segments in tcp_in_window()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 16 Nov 2026 22:08:53 +0800
X-Priority: 3
Message-ID: <tencent_57C872CA27EC27D22DD8E01E@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 7347081221287135650
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 16 Nov 2026 22:08:54 +0800 (CST)
Feedback-ID: lv:njupt.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJyF3+D7p4uct0eCQqfmwbI3CpfxOYmP44ZOVu2/nnRBFn5wcsOOHDSp
	6KlvKjlx3YgLKxArVI5LqCc1BsPZU0i8lnyk0NTV9Q0Oam7x+U/Wh23x1+iO5B+wznWV2Bu
	q7+GyrGE5hcE6WpTSAJ3V2KPpPEuzPjsKf0J7yufhaPPNGu+vOJzP4V2ksuaxGnUJFa4RiU
	L21PkWDnFX8l9hqoFgdgiLoHIlKP6yn8tTDb/dioFxtOLQ18vgjLdxHMgDIfsRyA65Y8axf
	CI9s4kkBitgpuELoMhzmFhhFfnqeUs9u+Ieu5W79cOdt9mJnsfrYyaa7KSz5eNaU80N2eqO
	BwZPsbzHqv3++GjOADWTor3jWtavqCHVdPQ7ol4kEBtl+Y5XGnbzr3l1u0HuBcTnbuDM+G+
	DxIGIw6V92z5arvaKxp3fBVYSJ/pg+UsfiCqYFVGh1edselO9/P1RcG5Whh6IbsiXn9HnVJ
	tvVjJqcCQ5CBDFZYU7gmbGD46APQBnBqu0cbFl84tuOOuwV2CujesQeBLp/M+bUVUzygVc6
	4UCoePCvVYlw1nLF0w8SBhZotlwvq+tdbDqNaHn21GH0Mjhljw/98hoLMNdPOdFRtpLeNgW
	tpxlmxAdgYI4cZdd0ocLFXsYyMM5htdrbg08GIV0hPjdmcYuChuksfd1E4r12Q2ZGYNAi/g
	nR9REt+jH0SVXoOrfZrzbiifoT6wEQFaPi5nI6foa+qvjM0TCIf5x8xb3docX5jf5bL8V3A
	xODTkOfSAF1J4sdz11gJCrxB6WF97wy2qV2Xdpti8qDslJ/jV+HzZ0jM1rnXZj8IVqfk2vi
	xryNRETp2mKfTiPIFyfNgbsimxwKcnyQkdcsj0hYP/abZWqbXJY+EjdnycTSindZ5FSuIdh
	U1u+1FugC9rWsv3x907Ig47X8CLxUruOoP9k/RNLoWh06WeTV4gElxWAOXJAk+LGiBwnEjG
	sMGfK3ktzpGxY4G2nsCFT/CB+CVsklupTlTTG4wK+VUUGcmjPZNdvNRbgMg6F9UrL4umoU2
	f6fo5lONHixBhWQUV+H0QeykB3R/q6U4ynyLH9O+DaX3Rfx4QD
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

SGksDQoNCldoaWxlIHJlYWRpbmcgdGNwX2luX3dpbmRvdygpIGluIG5ldC9pcHY0L3RjcF9t
aW5pc29ja3MuYywgSSBub3RpY2VkIHRoZSBmaW5hbCBjb25kaXRpb246DQoNCnJldHVybiBz
ZXEgPT0gZV93aW4gJiYgc2VxID09IGVuZF9zZXE7DQoNCk15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCB0aGlzIGNvdmVycyB0aGUgemVyby13aW5kb3csIHplcm8tbGVuZ3RoIGNhc2UgaW4g
UkZDIDkyOTMgVGFibGUgNiwgd2hlcmUgU0VRIGVxdWFscyBSQ1YuTlhULiBIb3dldmVyLCBp
dCBhbHNvIHNlZW1zIHRvIGFsbG93IGEgemVyby1sZW5ndGggc2VnbWVudCBhdCBTRVE9UkNW
Lk5YVCtSQ1YuV05EIHdoZW4gdGhlIHdpbmRvdyBpcyBub24temVybywgd2hlcmVhcyBUYWJs
ZSA2IHNwZWNpZmllcyBhIHN0cmljdCB1cHBlciBib3VuZCBmb3IgdGhhdCBjYXNlLg0KDQpP
biBVYnVudHUgNi44LjAtMTM4LWdlbmVyaWMsIEkgYWxzbyBvYnNlcnZlZCB0aGF0IGEgcHVy
ZSBBQ0sgYXQgdGhpcyByaWdodCBlZGdlLCBjb3JyZWN0bHkgYWNrbm93bGVkZ2luZyB0aGUg
U1lOLCBjb21wbGV0ZXMgdGhlIGhhbmRzaGFrZSB3aXRoIGEgbm9uLXplcm8gYWR2ZXJ0aXNl
ZCB3aW5kb3cuIFRoZSBVYnVudHUga2VybmVsIGFuZCBMaW51eCBtYWlubGluZSBzb3VyY2Vz
IEkgcmVjZW50bHkgaW5zcGVjdGVkIHJldGFpbiB0aGlzIGNvbmRpdGlvbi4NCg0KQ291bGQg
eW91IGNsYXJpZnkgd2hldGhlciB0aGUgbm9uLXplcm8td2luZG93IGNhc2UgaXMgaW50ZW50
aW9uYWxseSBpbmNsdWRlZCBpbiB0aGlzIGNoZWNrIGFzIHdlbGw/IEkgbm90aWNlZCB0aGUg
ZGlzY3Vzc2lvbiBvZiByZWxheGVkIHNlcXVlbmNlIHZhbGlkYXRpb24gaW4gUkZDIDkyOTMg
QXBwZW5kaXggQS4yLCBidXQgYW0gdW5zdXJlIHdoZXRoZXIgaXQgaXMgcmVsYXRlZCB0byB0
aGlzIHBhcnRpY3VsYXIgY2FzZS4NCg0KVGhhbmtzIQ==

