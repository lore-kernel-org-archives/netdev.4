Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528781;
	b=3IIsfGD+aZjlhFbhBh+05FyeELG1fk7I7sVCLGVgRWshb3ztZBiU/rRA/MkgMRyoqy3V
	 PQNM3BUW1cuLKAoFj/q+J/N5ef2eeWpojR4fCEkTSvpO37V4TZNDqeAxR/bJ/9ZDOyBy+
	 xqfh3sXv8Hn21en9qcgM/fknrCFu9BNQnIKmHE79Dk/dsDBZF5SSxS3CszmxbGuF5IzWk
	 FhZqXdrhE58cGlm85CkR37uD6b4Bo1yme6nw0rfOJiFHqByG8Q2FQS+GRqG/Otbb6mb8w
	 p/cQUuoEDpo1atQcJ/lHcLwOfDRAnDxxEMYh1p82J2va2ZLBWC/eMVVqyJLXv/HNv+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528781;
	h=DMARC-Filter:Content-Type:Content-Transfer-Encoding:Message-ID:To:Cc:
	 Subject:X-Priority:X-Mailer:X-Originating-IP:In-Reply-To:References:
	 MIME-Version:Received:From:Date:X-HM-Tid:X-HM-MType:X-HM-NTES-SC:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=xTzP+FWznfHpgFKA87GLlDPgUcxC4He0Ep3h6yFBigQ=;
	b=TZkCptHwr7UCXCOju5M18aRitqUEO1rDb+1tjqzD7OJ4c1lM/NaOLbCWf0IExpmwk/50
	 Hb5DPm9Y1OPSA28N81NnkQdProefpSXkHm41HFNUyiRl1KVY9+cmnEOQrrR/OD/TgMDfD
	 fQGb9JdWQUq4L/dlQ4DV+9qfK6aiSDY5XFnui2R5LcbGQtk6YQgfUaQFyJ/ahBRM71LK3
	 6T+urMBVH6AwGynJcIg25v8f7sktemOiveQGMd5J2v7ncs1UcPq5IArrFacplI3vPDr7C
	 LHNbhWLJZ7B8TqPrpQERtzZ79tML8gOvKXiNiLI2r7bfaXYE6UMVApQRSKlWMbwOYIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CHOCV15b;
	arc=none smtp.remote-ip=47.251.158.227
Received: from mail-m158227.netease.com (mail-m158227.netease.com [47.251.158.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53386606A32A;
	Tue, 24 Nov 2026 13:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53386606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CHOCV15b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AI*AUwChLCfQR70Ccf4TQapV.3.1795528770193.Hmail.202321181@mail.sdu.edu.cn>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFJlOiBSZTogW1BBVENIIG5ldF0gbmV0OiBwaHk6IG1pY3JlbDogRml4IHBvdGVudGlhbCBzaGFyZWQgUEhDIHVzZS1hZnRlci1mcmVl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
In-Reply-To: <ed84f6b1-4bed-4328-9278-02bbde45ca23@lunn.ch>
References: <20261107-0d0c29e10a-net-micrel-lan8814-1@mail.sdu.edu.cn> <71089325-dfab-45f7-9ebd-1feb65013863@lunn.ch> <AHAASAAGLPGJfVjn9skPJKoS.3.1794229559658.Hmail.202321181@mail.sdu.edu.cn> <198e6702-0663-4183-9aaf-0fa4082dbf79@lunn.ch> <ANsAuAAOLLS4OaDq0elM1KrN.3.1795091965243.Hmail.202321181@mail.sdu.edu.cn> <ed84f6b1-4bed-4328-9278-02bbde45ca23@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 202321181@mail.sdu.edu.cn( [101.76.249.61] ) by ajax-webmail ( [127.0.0.1] ) ; Tue, 24 Nov 2026 21:59:30 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Date: Tue, 24 Nov 2026 21:59:30 +0800 (GMT+08:00)
X-HM-Tid: 0aa20dda7e64d0cdkusy9f8e7101248b4
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMVHpP02bZAKsMEiErRSAekjx+ys+KNZNl0PLwl
	f2MeqR5lbiqKsoq8sm3hZVy9q3VetZ+Wq0Te/EdHEVk+2W3XygE0t2b+veD5v+x2w+urvHAkVDJd
	Ei1NnylQmVMR3mW/EzGaNxitlxEN6AvfBDt1A=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUsaVh9LTE9MSh1KGE8eGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=CHOCV15brrf7GYyCIOtxR1qTCNrLdwZhUlXaVhqJMp4+beBHoSqa0+Jo7vq3pYE8n5EJ7j8IEuvv2sBukAh11tPObDUpjO/LQ7EB4Xv5MSod+VebKeyfTl9SsLQLQD9pglxcwOgGaX8DYQG8bSvC8IFnBctTaHbY6E9ijta7LUk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=xTzP+FWznfHpgFKA87GLlDPgUcxC4He0Ep3h6yFBigQ=;
	h=date:mime-version:subject:message-id:from;

CgpIaSBBbmRyZXcsCgpGcm9tOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+CkRhdGU6IDIw
MjYtMTEtMTkgMjM6MjM6MTAKVG86ICAi5p2O5bm/56GVIiA8bGlndWFuZ3NodW9AbWFpbC5zZHUu
ZWR1LmNuPgpDYzogIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+LFJ1c3Nl
bGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPiwiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldD4sRXJpYyBEdW1hemV0IDxlZHVtYXpldEBrZXJuZWwub3JnPixKYWt1YiBL
aWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPixQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+
LG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpTdWJq
ZWN0OiBSZTogUmU6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHBoeTogbWljcmVsOiBGaXggcG90ZW50
aWFsIHNoYXJlZCBQSEMgdXNlLWFmdGVyLWZyZWU+PiBPbiBMQU44ODE0LCBpZiB0aGUgcmVnaXN0
ZXJpbmcgUEhZIHVuYmluZHMgZmlyc3QsIHRoZSBvdGhlciBwb3J0cyB3b3VsZAo+PiBsb3NlIGFj
Y2VzcyB0byB0aGUgUEhDLiBJcyB0aGF0IHRoZSBiZWhhdmlvdXIgeW91J2QgZXhwZWN0Pwo+Cj5O
bywgYXMgaSBrZWVwIHNheWluZywgaSBleHBlY3QgcmVtb3ZlIHRvIGJlIHRoZSBvcHBvc2l0ZSBv
ZiBwcm9iZS4gVGhlCj5maXJzdCBQSFkgcHJvYmVkIHNldHMgdXAgdGhlIFBIQy4gV2hhdCBpcyB0
aGUgb3Bwb3NpdGUgb2YgdGhhdD8gVGhlCj5sYXN0IFBIWSByZW1vdmVkIHJlbGVhc2VzIHRoZSBQ
SEMuCj4KPiAgICAgQW5kcmV3Cj4KClRoYW5rcyBmb3IgY2xhcmlmeWluZy4gSSBoYWQgdGllZCB0
ZWFyZG93biB0byB0aGUgcmVnaXN0ZXJpbmcgUEhZLApidXQgaXQgc2hvdWxkIGhhcHBlbiB3aGVu
IHRoZSBsYXN0IFBIWSBsZWF2ZXMgdGhlIHBhY2thZ2UuCgpJJ2xsIHJld29yayB0aGUgY2xlYW51
cCBhcm91bmQgdGhhdCBsaWZldGltZSwga2VlcGluZyB0aGUgUEhDIGFuZAppdHMgcGluIGFycmF5
IGFsaXZlIHVudGlsIHRoZW4uIEknbGwgYWxzbyBjaGVjayB0aGF0IHJlZ2lzdGVyIGFjY2Vzcwpy
ZW1haW5zIHZhbGlkIGFmdGVyIHRoZSBmaXJzdCBQSFkgaXMgdW5ib3VuZC4KClRoYW5rcywKR3Vh
bmdzaHVvCg==
