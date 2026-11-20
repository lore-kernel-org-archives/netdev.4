Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158742;
	b=E9XPod0yffpB3ffo2brRtunFDzGEhWf1yRh0TTvm9rEQ5ELSyVLXfjKH9XTeEzboaTsg
	 tI0/61O8ANq7sUUn4QV1ZDTnNsC5oxMrCrYLRcbwIELWoqvmKAhYmUj35AiIgLjgO2q4f
	 M2e6IW1z/aTQR+v7ErkWgc8xjoyihmy9zt8HYdU9ScgFsB75z5NKAjkjxLyPMPr6BHbx2
	 N2otZ/B1WnrwzuiCkLQPbKvxJK/AsnPW2VZMogD5Z1utLurH9sXs9P0CoY/StbcXfxXeZ
	 8debsBSlxkXXznG88dj2QChmiHpZqtN33vAx0GECFjR1lwUtj+gXc2Y7jsd4RYpJCsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158742;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=qX8EF9UzcSHkK5jYG8/UCm+mUkzB2dXFDP3zCYxCO2I=;
	b=vg8jK+Ada/GlFMtgcDLSZ22ymZdr+LDqYuKR+hVz7Pb6SucZN5Uo7T/t+jZmbBrbI3y1
	 Uc1YCnsGKqTmLhPobp9bWZFGqF7UuZ7DouebFRCtRW2Vx6wc+4L31Fl79xuvq01VsWgJY
	 StWlIIBAuvORc28ZnW2L/JfzN5uID5HvouaOltCEHmoTFOZRariFTSO3qwRHDS1dq5Fci
	 5S9QsJuueMzMIky4A/ZLaWcNdvyqjNxEwpV0ZWw77BBCt0anE9Xw0kJ04OjLwIqXH05tb
	 Cv6fHk/syHPj+g7pEtKIuqU0cuoi4x5gJwdA8a7onr6Y0GLImi2SAUFUyY6oB6jvF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SQQ96djH;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8C606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF8C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SQQ96djH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=qX8EF9UzcSHkK5jYG8/UCm+mUkzB2dXFDP3zCYxCO2I=; b=S
	QQ96djHjzY99eSnVlIwkF4Qa4mx9Fg3ZnTsQPFW/9AaM+DFk9Yz3fJ2sum4ZZIH7
	Q27CY0Ofo11iSCemxWXQpuLgjIy+ShvJ/CR+lIvd7ZTaPb7jJT96sKo5ZydTTMob
	M78N62+acLzC8Dcr1AqGASkt4RDMkW67Sf9F+PUi/s=
Date: Fri, 20 Nov 2026 15:11:53 +0800 (CST)
From: "Lange Tang" <lange_tang@163.com>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "mst@redhat.com" <mst@redhat.com>, "Eugenio Perez" <eperezma@redhat.com>,
	"jasowangio@gmail.com" <jasowangio@gmail.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"Tang Longjun" <tanglongjun@kylinos.cn>
Subject: Re:Re: [PATCH 2/3] virtio_net: introduce an RX queue watchdog for
 stuck detection
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261112085333.77476864@kernel.org>
References: <20261109094310.103979-1-lange_tang@163.com>
 <20261109094310.103979-3-lange_tang@163.com>
 <20261112085333.77476864@kernel.org>
X-NTES-SC: AL_Qu2SB/2et08q5SmYbOkfmUgRg+c/XsK4svUj24VVOJF8jCDp+SEJYHZTFGvuwfi3ASqsmSO8ahFRxdZ2WohybrglIZCqJtKGFn1jtPc3pyMItQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <2cca370d.59a4.1a1f7cc263c.Coremail.lange_tang@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aigvCgBnb8a68v9q8nxyAA--.370W
X-CM-SenderInfo: 5odqwvxbwd0wi6rwjhhfrp/xtbC-RmFs2r-8rlpsgAA3X
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMS0xMyAwMDo1MzozMywgIkpha3ViIEtpY2luc2tpIiA8a3ViYUBrZXJuZWwub3Jn
PiB3cm90ZToKPk9uIE1vbiwgIDkgTm92IDIwMjYgMTc6NDM6MDkgKzA4MDAgTG9uZ2p1biBUYW5n
IHdyb3RlOgo+PiBUaGUgYmFja2VuZCByYWlzZXMgYW4gaW50ZXJydXB0IGFmdGVyIGFkZGluZyBi
dWZmZXJzIHRvIHRoZSB1c2VkIHJpbmcsCj4+IGFuZCB0aGUgaHlwZXJ2aXNvciBpbmplY3RzIGl0
LiBJZiBvbmUgaXMgbG9zdCAoZS5nLiwgYSB0cmFuc2llbnQgS1ZNCj4+IGZhaWx1cmUpLCBOQVBJ
IHdpbGwgbm90IGJlIHNjaGVkdWxlZCBhbmQgdGhlIGRyaXZlciBzdG9wcyBjb25zdW1pbmcKPj4g
YnVmZmVycy4gVGhlIHJpbmcgZXZlbnR1YWxseSBmaWxscyB1cCwgdGhlIGJhY2tlbmQgc3RvcHMg
bm90aWZ5aW5nLCBhbmQKPj4gdGhlIHF1ZXVlIGlzIGxlZnQgcGVybWFuZW50bHkgc3R1Y2suCj4K
PkNhbiB5b3Ugc2F5IG1vcmUgYWJvdXQgd2hhdCBwbGF0Zm9ybSB5b3UncmUgaGl0dGluZyB0aGlz
IHByb2JsZW0gb24/Cj5BbiB3aGF0J3MgdGhlIHZpcnRpbyBiYWNrZW5kPwoKYXJtNjQgZ3Vlc3Q7
IHRoZSBiYWNrZW5kIGlzIE9WUy1EUERLICh2aG9zdC11c2VyKS4gVG8gYmUgaG9uZXN0LCBJIGlu
ZmVycmVkIHRoZSBsb3N0CmludGVycnVwdCBmcm9tIHRoZSBndWVzdCBzaWRlICh2aXJ0aW9fbmV0
IFJYIHF1ZXVlIHN0dWNrKSByYXRoZXIgdGhhbiB0cmFjaW5nIHRoZSBiYWNrZW5kLAphbmQgcmVw
cm9kdWNlZCB0aGUgc3RhbGwgYnkgdGVtcG9yYXJpbHkgbWFza2luZyB0aGUgaW50ZXJydXB0IGlu
amVjdGlvbi4=
