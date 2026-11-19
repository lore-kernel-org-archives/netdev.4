Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092350;
	b=hGZohFaQGJm9vp6bP1EVJdBjXkTvnLSjxMTnm8TCi6n7bLr/E7vPkpfd5LTfrMnfO1a7
	 cM6K7lXgyQNl9Gdhs/S6+YmFse+XJlvOzWHSwYCK8vQB+Jyg8oJXe9mQoa55/Bm/3/EFU
	 71q1Db2SQUte7qZ8ONElOlPs2kjEQJJXz2unYfwiqI5o0Yd8R/nWysyEFnue3ILmmEqfk
	 QA3X+PaVu5Ppzwv6j54JyIET5rIksJO5cfYtu85mdHtgDuCTmkVvpQRhiYxFkguhS0QEP
	 1w4PuPQAHH2rf2TS1gicFE4i36vBVHfDBUX8ZJmR43Vk2UXeBNtWUpVKpbgU3jBj9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092350;
	h=DMARC-Filter:Content-Type:Content-Transfer-Encoding:Message-ID:To:Cc:
	 Subject:X-Priority:X-Mailer:X-Originating-IP:In-Reply-To:References:
	 MIME-Version:Received:From:Date:X-HM-Tid:X-HM-MType:X-HM-NTES-SC:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Wi03TWgTP7S39IPDFwHnr5HmwCqL92fnjVPr4/ZOhTg=;
	b=f1ePxQqLJaiP0BjehTWSWKiggUHEdLDOuX8evAhCsMltniMGPjiJH9sJKDhKfjG1dc5r
	 yk37dFhSLsmqlY/mtBWOWo5Qp+SJKMAZHWj6z5Wt6n94IB42ghUp5Wg4GlCmgQB5j7oDE
	 FhvK40nUHYGVlQYfFo7ki+aTj5MpILaxXTKBxlBDuc9EfSXbNfeeEVgDkJY1b5pmEfyoy
	 qg7WClVO1RPvtCdIIR3gyg10xFi2XKFXYLOtYYnq7Yqvc/tESxDhixwgYZshGOlWM0BbB
	 h3UpFZEYqoSNeIgltQr8niyIK2x39JE1I/cHQR1UCVI51LXcu308fZ5bqy9cWply30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=L4V4W9Lk;
	arc=none smtp.remote-ip=103.209.128.2
Received: from mail-m1282.netease.com (mail-m1282.netease.com [103.209.128.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BB606A324;
	Thu, 19 Nov 2026 12:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=L4V4W9Lk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AAEA*wA8LCG4Zr0pjYZ8NKo8.3.1795092340086.Hmail.202321181@mail.sdu.edu.cn>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBuZXQgMS8yXSBuZXQ6IGFsdGVyYTogRml4IHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBvbiByZW1vdmFs?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
In-Reply-To: <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn> <20261117-571e631490-net-1@mail.sdu.edu.cn> <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 202321181@mail.sdu.edu.cn( [101.76.249.61] ) by ajax-webmail ( [127.0.0.1] ) ; Thu, 19 Nov 2026 20:45:40 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Date: Thu, 19 Nov 2026 20:45:40 +0800 (GMT+08:00)
X-HM-Tid: 0aa1f3d6e57ad0cdkusy0c757bdb16017
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMVHpP02bZAKsMEiErRSAekjx+ys+KNZNl0PLwl
	f2MeqR5lbiqKsoq8sm3hZVy9q3VVBNOjIUwfWq1GfV2NBR9WJV5pp9Gwt04oeFjraKOA9zdjwmFX
	MDdZv6bOmTPK2b/NjUfESiX3Ehf/s1YYomK2g=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRlNVkIZHxpKS0MeHh1NGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=L4V4W9LkNybYZZvTVk3ld99rdG0wsNfNE4OKl+LfqlKsFVBy9doKSbRPlfY+2oZJPfpOpWm7EjBr4mzG3a3XYRv8827GBaeVtQOmeAAfwJw/r1Fktw+LIuHhRBfrumcMzjHQB4Wjy+lmu7woWB4aB+Kbg3cWOgTJMGH77BqTQTM=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=Wi03TWgTP7S39IPDFwHnr5HmwCqL92fnjVPr4/ZOhTg=;
	h=date:mime-version:subject:message-id:from;

CgpIaSBBbmRyZXcsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpGcm9tOiBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+CkRhdGU6IDIwMjYtMTEtMTggMDI6MDU6MzAKVG86ICBHdWFuZ3NodW8g
TGkgPGxpZ3VhbmdzaHVvQG1haWwuc2R1LmVkdS5jbj4KQ2M6ICBCb29uIEtoYWkgTmcgPGJvb24u
a2hhaS5uZ0BhbHRlcmEuY29tPixBbmRyZXcgTHVubiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPiwi
RGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4sRXJpYyBEdW1hemV0IDxlZHVt
YXpldEBrZXJuZWwub3JnPixKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPixQYW9sbyBB
YmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+LE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQGFtZC5j
b20+LG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyxs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKU3ViamVjdDogUmU6IFtQQVRDSCBu
ZXQgMS8yXSBuZXQ6IGFsdGVyYTogRml4IHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBvbiByZW1v
dmFsPj4gRml4ZXM6IGJiZDIxOTBjZTk2ZCAoIkFsdGVyYSBUU0U6IEFkZCBtYWluIGFuZCBoZWFk
ZXIgZmlsZSBmb3IgQWx0ZXJhIEV0aGVybmV0IERyaXZlciIpCj4KPlRoZSB1c3VhbCBxdWVzdGlv
bjogRG9lcyB0aGlzIGJvdGhlciBhbnlib2R5Pwo+Cj5JZiBub3QsIG5ldC1uZXh0LCBubyBGaXhl
czoKPgo+ICAgIEFuZHJldwo+Cj4tLS0KPnB3LWJvdDogY3IKPgoKSSBmb3VuZCB0aGlzIGJ5IHJl
YWRpbmcgdGhlIHJlbW92ZSBwYXRoLiBJIGRvbid0IGhhdmUgYSB1c2VyIHJlcG9ydApvciBhIHJl
cHJvZHVjdGlvbiBvbiBBbHRlcmEgaGFyZHdhcmUuCgpHaXZlbiB0aGF0LCB3b3VsZCB5b3UgcHJl
ZmVyIHRoZSBBbHRlcmEgcGF0Y2ggb24gaXRzIG93biBmb3IgbmV0LW5leHQsCndpdGhvdXQgdGhl
IEZpeGVzIHRhZz8gSWYgc28sIEknbGwgcmVzZW5kIGl0IHRoYXQgd2F5LgoKVGhhbmtzLApHdWFu
Z3NodW8K
