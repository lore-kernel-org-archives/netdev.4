Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433115;
	b=oONVM5KqRNQsq+06V8T535V1ZMSc2iep2WUQRTC0kyjVD/282sFAegvHQZOHRYFB4/Hq
	 u10osKAsFBjBsCRv9aoFLg/kkAT+50sh3p9hEuaNEAahvr1PpNFvrLS6hqCmxczENRD9j
	 NbyYPPxg91BwWJnTib24jW1srLj58pO8x2KgoMeWXKf869F3beEv93QN5xjkBWwbM0o1C
	 W785dXElbyfMyiI7ETE38ed25dNTMNrxjt0x5PHCH/lm6IcfrZNQnVvWca1RSBvseYb9R
	 wxP2SoivLggMXCKmJKvSKCHy3kImcL51+c/PaUmJPCuU7+P6ssVVymAYQK/x7vVXBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433115;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:
	 X-CM-HeaderCharset:From:To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:
	 References:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=pd7yZOfR/6/VdDILFb0nLqoZvgJwsuh6QMQF6pgZpBQ=;
	b=mK8H2+uMB3gWElkQpxbRvIoS1C0aqGFaQk8TXg3MtSNa8OdpAcLfhht0J0IsyzidXGHi
	 0nioTaArRSBo+ifqBehvosZzaVNmEyE3h3aDmtzGnrj6JndgUGJ8vGyPS0+dzN9jxpP7J
	 /8ipg5/4MeQK+Ce0pATsrBXx0faW3k/MJgoTMvfRh75WlAZJKSSvs9eT9UIka2GPBUYtn
	 2G6IluSiThD6L+szkf02T6ur+IceeaIvGjGG/aTvxfr1ezAhXbs5/BvOYNHdaABWmp7QI
	 +Xgrxmnv2qE0b2DmZuVlxziZjU1KlNfDd5AOXq+dQ702DJqljV/S/zXrWr0AD9vXy/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=fail reason="signature verification failed" header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nkwPE3gD;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C83606A31A;
	Mon, 23 Nov 2026 11:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C83606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nkwPE3gD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=/Ggu3rj0ThvKcNpBPXLiuiRBY02aVQgcwxpp
	10zH9iI=; b=nkwPE3gDvJGKrSHgbKpWIGcydqeX56abOG+5Qe9CkWFoxWH4IguJ
	9H84WETfFpEFGA/uEnnqL8HzGz5BJKHtby8AtWKnoGWUarBKdhQQ2/zKodlZus/C
	YBcc9YS8dcPYOTBYgGdY0/UWJ/aaYrVNQWudojT11gzkb25sC6hIE+c=
Received: from wanghr2026$mail.zgclab.edu.cn ( [58.206.202.88] ) by
 ajax-webmail-web2 (Coremail) ; Mon, 23 Nov 2026 19:24:40 +0800 (GMT+08:00)
Date: Mon, 23 Nov 2026 19:24:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5rWp54S2?= <wanghr2026@mail.zgclab.edu.cn>
To: netdev-bot+sinfo@kernel.org
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on
 setup failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT5 build
 20261010(691d8f62) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-4df55a87-4b50-4a66-85a0-70f79cb6c8b5-tsinghua.edu.cn
In-Reply-To: <179543235894.3294.8827397951204336522@kernel.org>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
 <179543235894.3294.8827397951204336522@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <2a2bfab1.269a1.1a20826a7dd.Coremail.wanghr2026@mail.zgclab.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:yQQGZQCHtmp4IgRrBoVgAQ--.19466W
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQYAD2sD8X5PDgABsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

LSBIb3cgaXQgd2FzIGRpc2NvdmVyZWQuIFN0YXRpYyBzY2FubmluZywgbm90IGEgcnVudGltZSBy
ZXBvcnQuIEkKc2Nhbm5lZCBmb3IgcmVndWxhdG9yX2VuYWJsZSgpIGNhbGxzIGFuZCBjaGVja2Vk
IHRoYXQgZWFjaCBvbmUgaGFzIGEKbWF0Y2hpbmcgcmVndWxhdG9yX2Rpc2FibGUoKSBvbiB0aGUg
ZXJyb3IgcGF0aHMuIG10NzUzMF9zZXR1cCgpCmVuYWJsZXMgdGhlIGNvcmUgYW5kIGlvIHJhaWxz
LCBidXQgb25seSBtdDc1MzBfcmVtb3ZlKCkgZGlzYWJsZXMgdGhlbSwKc28gYSBwcm9iZSB0aGF0
IGZhaWxzIGFmdGVyIHRoZSBlbmFibGUgaGFzIG5vIG1hdGNoaW5nIGRpc2FibGUuCi0gV2hldGhl
ciBpdCB3YXMgdHJpZ2dlcmVkLiBJdCB3YXMgbm90IHRyaWdnZXJlZCwgYW5kIEkgZGlkIG5vdApy
ZXByb2R1Y2UgaXQgb24gaGFyZHdhcmUuIAoKClRoYW5rcywKSGFvcmFuCgoKPiAtLS0tLeWOn+Wn
i+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiBuZXRkZXYtYm90K3NpbmZvQGtlcm5lbC5vcmcKPiDl
j5HpgIHml7bpl7Q6MjAyNi0xMS0yMyAxOToxMjozOCAo5pif5pyf5LiAKQo+IOaUtuS7tuS6ujog
Ikhhb3JhbiBXYW5nIiA8d2FuZ2hyMjAyNkBtYWlsLnpnY2xhYi5lZHUuY24+Cj4g5oqE6YCBOiBj
aGVzdGVyLmEudW5hbEBhcmluYzkuY29tLCBkYW5pZWxAbWFrcm90b3BpYS5vcmcsIGFuZHJld0Bs
dW5uLmNoLCBvbHRlYW52QGdtYWlsLmNvbSwgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRA
a2VybmVsLm9yZywga3ViYUBrZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWF0dGhpYXMu
YmdnQGdtYWlsLmNvbSwgYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tLCBu
ZXRkZXZAdmdlci5rZXJuZWwub3JnLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcsIGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjJdIG5ldDogZHNhOiBtdDc1MzA6IGRp
c2FibGUgdGhlIHBvd2VyIHJhaWxzIG9uIHNldHVwIGZhaWx1cmUKPiAKPiBIaSEKPiAKPiBUaGlz
IGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlLiBUaGlzIHNlcmllcyBsb29rcyBsaWtlIGEgZml4LCBi
dXQgaXRzCj4gY29tbWl0IG1lc3NhZ2VzIHNlZW0gdG8gYmUgbWlzc2luZyBzb21lIGluZm9ybWF0
aW9uOgo+IAo+ICAtIEhvdyB0aGUgaXNzdWUgd2FzIGRpc2NvdmVyZWQsIGUuZy4gaGl0IGluIHBy
b2R1Y3Rpb24sIGhpdCBkdXJpbmcKPiAgICBkZXZlbG9wbWVudCwgc3l6Ym90IHJlcG9ydCwgbWFu
dWFsIGNvZGUgaW5zcGVjdGlvbiwgTExNIG9yIHN0YXRpYwo+ICAgIGFuYWx5c2lzIHRvb2wgc2Nh
bi4KPiAKPiAgLSBXaGV0aGVyIHRoZSBpc3N1ZSB3YXMgYWN0dWFsbHkgdHJpZ2dlcmVkLCBvciBp
cyBvbmx5IHRoZW9yZXRpY2FsCj4gICAgKGUuZy4gZm91bmQgYnkgTExNIGFuZCBub3QgcHJvdmVu
IGF0IHJ1bnRpbWUpLiBJZiBpdCB3YXMgdHJpZ2dlcmVkCj4gICAgcGxlYXNlIGluY2x1ZGUgdGhl
IHN5bXB0b21zLCBsaWtlIHRoZSBzdGFjayB0cmFjZSBvciBrZXJuZWwgbWVzc2FnZXMuCj4gCj4g
UGxlYXNlIGRvIG5vdCByZXBvc3QgdGhlIHNlcmllcyBqdXN0IHRvIGFkZHJlc3MgdGhlIGFib3Zl
LiBJbnN0ZWFkLAo+IHJlcGx5IHRvIHRoaXMgZW1haWwgd2l0aCB0aGUgbWlzc2luZyBpbmZvcm1h
dGlvbiwgc28gdGhhdCByZXZpZXdlcnMKPiBjYW4gdGFrZSBpdCBpbnRvIGFjY291bnQuCj4gCj4g
KklNUE9SVEFOVCo6IElmIHlvdSBkbyByZXBvc3QgKGZvciBvdGhlciByZWFzb25zKSAtIHBsZWFz
ZSBpbmNsdWRlCj4gdGhlIHJlbGV2YW50IGluZm8gaW4gdGhlIGNvdmVyIGxldHRlciBvciBjb21t
aXQgbWVzc2FnZXMuCj4gLS0gCj4gVGhlIGV2YWx1YXRpb24gaXMgZG9uZSBieSBhbiBMTE0gc28g
aXQgbWF5IGJlIHdyb25nLCBpZiB5b3UgdGhpbmsKPiB0aGF0IGlzIHRoZSBjYXNlIHBsZWFzZSBy
ZXBseSBhbmQgZXhwbGFpbi4K
