Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091979;
	b=EaWPCNwoZa0MKjc0PSn12fxenPuwiqWy4KnEP/Os+iTAPfAnZgHQoBVJeUJ3Yg0CC5Xi
	 ajuaNhJCtKW9SuP9RI22S1AwII4gK0dZ+oRDDrcSZHmz2kcYZWR9vkBGQY5GeZCa4EG5i
	 beMIDoxCRovJ+FNkVdZ7PxRkWha+rQ/4YSWS8FSrgfydyz/cuJMuX9XtSG7WsLagy2um0
	 lY6UsWzMXCqMss36B458PuzDzWaDKXhfKPqnuw63Nk1j3s/H5mSlpfKL+xbeCd4NM3EIp
	 Nb4qEFyyWJYYAYDXNOwHxQ/z2aVQ8OE/mqWqKyw9RN5Saps1ns8PR4hwq6fNq2jrwEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091979;
	h=DMARC-Filter:Content-Type:Content-Transfer-Encoding:Message-ID:To:Cc:
	 Subject:X-Priority:X-Mailer:X-Originating-IP:In-Reply-To:References:
	 MIME-Version:Received:From:Date:X-HM-Tid:X-HM-MType:X-HM-NTES-SC:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=TtZo8qi0yMQmeEgYEritOsIKkI1LjDTw7un+1MqJmE4=;
	b=MN1edoBGma5A1EI9jc8jSvwN75vpSJU0ODv31WsDyNy07ZN5ekJ9c3JIRCkd42nVsils
	 jNSNGkl0UZDdKjJb681TIZzIK0EcZzb4p/YqGLPj4kc9SC2AFQzT8/zkpbZ84pXAxZJrj
	 rCa2YrY49lPvehUVGpzgmO2Fv76qOGwmHKMFtyQ/n2va7zTQOrdk+GWOhRLtfKmJ5XzZg
	 YXZmEftoTbfwVV0/wufXPiGGXi0fxyRiez1WoXkCA4bdYNHqO+VUPczXQLPrECAYD4hDo
	 0wFW2hHAkmojbP95KyqjWTY+g1sTmEY7ATJYaHeiQa/BgW1AyuD4aqtQv9Ccjf+xb8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=RgzKuWNa;
	arc=none smtp.remote-ip=160.236.53.99
Received: from mail-m1602365399.xmail.ntesmail.com (mail-m1602365399.xmail.ntesmail.com [160.236.53.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A3606A325;
	Thu, 19 Nov 2026 12:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=RgzKuWNa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ANsAuAAOLLS4OaDq0elM1KrN.3.1795091965243.Hmail.202321181@mail.sdu.edu.cn>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHBoeTogbWljcmVsOiBGaXggcG90ZW50aWFsIHNoYXJlZCBQSEMgdXNlLWFmdGVyLWZyZWU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
In-Reply-To: <198e6702-0663-4183-9aaf-0fa4082dbf79@lunn.ch>
References: <20261107-0d0c29e10a-net-micrel-lan8814-1@mail.sdu.edu.cn> <71089325-dfab-45f7-9ebd-1feb65013863@lunn.ch> <AHAASAAGLPGJfVjn9skPJKoS.3.1794229559658.Hmail.202321181@mail.sdu.edu.cn> <198e6702-0663-4183-9aaf-0fa4082dbf79@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 202321181@mail.sdu.edu.cn( [101.76.249.61] ) by ajax-webmail ( [127.0.0.1] ) ; Thu, 19 Nov 2026 20:39:25 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Date: Thu, 19 Nov 2026 20:39:25 +0800 (GMT+08:00)
X-HM-Tid: 0aa1f3d10d27d0cdkusyc2efd20915ff3
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMVHpP02bZAKsMEiErRSAekjx+ys+KNZNl0PLwl
	f2MeqR5lbiqKsoq8sm3hZVy9q3VVBNOjIUwfWq1GfV2NBR9WJV5pp9Gwt04oeFjraKOA9zWjE8p5
	KoKSSO99HJT4uKmanxHyqHOh7vgKC4GTy3sWc=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHR5IVhkZSx9LQh5OGU4eHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=RgzKuWNaH3PPRvKqTPax8bpZNow1TFTnBy4BO9yOU3GVFLZgNUPqjfCtvpo9Q3ugzqWlYIFF/pql5y6aaXqCn9X0R4qpO3eGL6NtprarsHWHfPRUvV46rKJxTT/1Vr5ssMNlXXlHJs2pV+XsukvntR2dbDx7btrR4VXn7uA5IgA=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=TtZo8qi0yMQmeEgYEritOsIKkI1LjDTw7un+1MqJmE4=;
	h=date:mime-version:subject:message-id:from;

CgpIaSBBbmRyZXcsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpGcm9tOiBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+CkRhdGU6IDIwMjYtMTEtMDkgMjE6MjQ6MzMKVG86ICAi5p2O5bm/56GV
IiA8bGlndWFuZ3NodW9AbWFpbC5zZHUuZWR1LmNuPgpDYzogIEhlaW5lciBLYWxsd2VpdCA8aGth
bGx3ZWl0MUBnbWFpbC5jb20+LFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPiwi
RGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4sRXJpYyBEdW1hemV0IDxlZHVt
YXpldEBrZXJuZWwub3JnPixKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPixQYW9sbyBB
YmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+LG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwpTdWJqZWN0OiBSZTogUmU6IFtQQVRDSCBuZXRdIG5ldDogcGh5
OiBtaWNyZWw6IEZpeCBwb3RlbnRpYWwgc2hhcmVkIFBIQyB1c2UtYWZ0ZXItZnJlZT4+ID4ucHJv
YmUoKSBhbmQgLnJlbW92ZSgpIHNob3VsZCBiZSBvcHBvc2l0ZXMgb2YgZWFjaCBvdGhlci4gV2hh
dCBoYXBwZW5zCj4+ID5pZiB5b3UgZG8gdGhhdD8KPj4gPgo+PiA+ICAgIEFuZHJldwo+PiA+Cj4+
ID4tLS0KPj4gPnB3LWJvdDogY3IKPj4gPgo+PiAKPj4gT24gTEFOODgxNCwgb25lIFBIWSByZWdp
c3RlcnMgdGhlIHNoYXJlZCBQSEMgYW5kIG93bnMgaXRzIHBpbiBhcnJheS4KPj4gSWYgdGhhdCBQ
SFkgdW5yZWdpc3RlcnMgdGhlIGNsb2NrIGluIC5yZW1vdmUoKSwgdGhlIGNsb2NrIGdvZXMgYXdh
eQo+PiBiZWZvcmUgdGhlIHBpbnMgYXJlIGZyZWVkLiBJZiBhbm90aGVyIHBvcnQgaXMgc3RpbGwg
Ym91bmQsIGl0IGxvc2VzCj4+IGFjY2VzcyB0byB0aGUgUEhDLiBJIGFkZGVkIHRoZSBoYW5kb2Zm
IGluIHYxIHRvIGtlZXAgdGhlIGNsb2NrCj4+IGF2YWlsYWJsZSBpbiB0aGF0IGNhc2UuCj4+IAo+
PiBJJ2xsIHJld29yayB0aGlzIGFyb3VuZCB0aGUgUEhZIHRoYXQgcmVnaXN0ZXJlZCB0aGUgY2xv
Y2suIEknbGwgY2hlY2sKPj4gaG93IHRoZSByZW1haW5pbmcgcG9ydHMgcmVwb3J0IHRoZSBQSEMg
YWZ0ZXIgdGhhdCBQSFkgdW5iaW5kcywgYW5kCj4+IHdoYXQgaGFwcGVucyBpZiBpdCBiaW5kcyBh
Z2FpbiB3aGlsZSBhbm90aGVyIHBvcnQgaXMgc3RpbGwgdXAuCj4KPlRoYXQgaXMgbm90IHdoYXQg
aSBhc2tlZCBmb3I6Cj4KPi5wcm9iZSgpIGFuZCAucmVtb3ZlKCkgc2hvdWxkIGJlIG9wcG9zaXRl
cyBvZiBlYWNoIG90aGVyLgo+Cj5UYWtlIHRoZSBwcm9iZSBmdW5jdGlvbiBhbmQgcmV2ZXJzZSB0
aGUgb3JkZXIgb2YgdGhlIGxpbmVzLgo+Cj5UaGVuIHJldmVyc2Ugd2hhdCBlYWNoIGZ1bmN0aW9u
IGRvZXMuCj4KPglBbmRyZXcKPgoKUHJvYmUgcmVnaXN0ZXJzIHRoZSBQSEMgYWZ0ZXIgYWxsb2Nh
dGluZyBpdHMgcGlucywgdGhlbiBzZXRzIHVwCnRpbWVzdGFtcGluZyBvbiB0aGUgcG9ydC4gUmVh
ZGluZyB0aGF0IGJhY2t3YXJkcywgSSdkIHRlYXIgZG93biBwb3J0CnRpbWVzdGFtcGluZyBmaXJz
dCwgdGhlbiB1bnJlZ2lzdGVyIHRoZSBjbG9jayB3aGlsZSBpdHMgcGlucyBhcmUgc3RpbGwKdmFs
aWQuCgpPbiBMQU44ODE0LCBpZiB0aGUgcmVnaXN0ZXJpbmcgUEhZIHVuYmluZHMgZmlyc3QsIHRo
ZSBvdGhlciBwb3J0cyB3b3VsZApsb3NlIGFjY2VzcyB0byB0aGUgUEhDLiBJcyB0aGF0IHRoZSBi
ZWhhdmlvdXIgeW91J2QgZXhwZWN0PyBJZiBzbywgSSdsbApzZW5kIGEgdjIgdGhhdCBwYWlycyBy
ZWdpc3RyYXRpb24gYW5kIHJlbW92YWwgb24gdGhlIHNhbWUgUEhZLgoKVGhhbmtzLApHdWFuZ3No
dW8K
