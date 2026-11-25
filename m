Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.209.48.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635739;
	b=V8+ApXnZ3UuoGxy6XmE2MiifCc01cVr8vS8r8WeGwpb73eVk5OcECXZ6X4HHDPcyjzCp
	 69Fp8eab7op8cCxw32wjUXk8C7vhC91TRH93aP+mftRk2p8eB6PTV8JnnGO0VAr7rAykV
	 1iTRjA93FPloYUGega8Z6m77MHu5D32vV4sWZ7ZWke+egfHfx8BR498QCrzmNRcRCoZ2Z
	 nZhvMaEukxiIWckUoW1m+VY+AsVzt7AT0NKxTCGyUIiaB8fg3H7VimltD5qyAV5AtkJIg
	 xSl2sMcLe5VW8LalQSA6RCTL2GTVMyK4gxMzVmy3765LlGxu84amUyUQn898tZDjKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635739;
	h=DMARC-Filter:DKIM-Signature:Received:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 Cc:From:Subject:Autocrypt:Content-Type;
	bh=foSggI31I/mGpbwe9Z/FqTQxaUacT8pBMqHTeZmpTNY=;
	b=wgjUntQ+5I3eZsEJ/3XmR6+GuYszYg03xdYExVWi5VOG00vNCq9qF6FhmGGDEnsYG0Qb
	 Sk2cpy3c7+mbUNAi5BLRX4CEggPhq6h3zRGlrqi6/gcRgGGklM0RjyqhF4ssDiC9UfxL2
	 xrleAxonIE4uRj5d1oTqGwa4D41Un4vdB4T3nz0rxnZmS6BMGxAKv3ulDVuibO2pHFX12
	 9KgnOyWvrSEnRW/dFtus9FoQQ+AvCif/JNu4IhXvqePVgxIfzCrQo+eGClSsqqIdRtHHe
	 HHD+xXu12FpgSN8UQCFLZbl0r+MwitcO/yFAsnqzHl8xQ2cnn/WHvTcozqGAvESz11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trustserv.de;
	spf=pass smtp.mailfrom=trustserv.de;
	dkim=pass header.d=trustserv.de header.i=@trustserv.de header.a=rsa-sha256 header.s=202609 header.b=Z2fgC1B4;
	arc=none smtp.remote-ip=85.209.48.205
Received: from server.trustserv.de (server.trustserv.de [85.209.48.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E24606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trustserv.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustserv.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trustserv.de header.i=@trustserv.de header.a=rsa-sha256 header.s=202609 header.b=Z2fgC1B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustserv.de;
	s=202609; t=1795635731;
	bh=foSggI31I/mGpbwe9Z/FqTQxaUacT8pBMqHTeZmpTNY=;
	h=Date:To:Cc:From:Subject:From;
	b=Z2fgC1B4vkmuUXNd75Wz2pz5LbVARqZ42aR/P66GTCO6rg2UHJW26eY7CZmvezWx5
	 rZLmPHqmbrfiYGCt6xv7JqHuaIQ/DhPqJPHPT7t0QcNTqINK1Xx/1ngZys2EzUMhYJ
	 vpgcinRP8mR+ewBfSEAJWQ59aTNbhbJ1w5hogjOYJAj5u98XYnMqM0wNzE4ngJTJiE
	 3KzIvtlqUcYjFEzbckH89itqodXV15ELzjLnkckPyCurU7Aofwo4LFZulA16qP3hO/
	 8I9DRsxffcRpf4+7bsR03BfxbGlxs6BVzLvA9SI0mX7E4dzAm2rPh6tGKyeaEs1I0T
	 mAyaX3KxluIKw==
Received: from localhost (localhost [127.0.0.1])
	by server.trustserv.de (Postfix) with ESMTP id 6A0D75FED5;
	Wed, 25 Nov 2026 20:42:11 +0100 (CET)
X-Virus-Scanned: Debian amavis at trustserv.de
Received: from server.trustserv.de ([127.0.0.1])
 by localhost (trustserv.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LS3_nv0e1Bv; Wed, 25 Nov 2026 20:42:09 +0100 (CET)
Received: from [10.0.20.124] (unknown [85.195.252.87])
	by server.trustserv.de (Postfix) with ESMTPSA id 0305E5FE29;
	Wed, 25 Nov 2026 20:42:08 +0100 (CET)
Message-ID: <76e0c33b-475f-4533-909c-ea06d77aafb7@trustserv.de>
Date: Wed, 25 Nov 2026 20:42:07 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: ansuelsmth@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, daniel@makrotopia.org,
 hkallweit1@gmail.com
From: "Oli Z." <olze@trustserv.de>
Subject: as21xxx: AS21010 fw 1.9.1 frame-length drops (VEND1 0x103c) and,
 phantom test-pattern frames on BPI-R4 Pro
Autocrypt: addr=olze@trustserv.de; keydata=
 xjMEZw+zqhYJKwYBBAHaRw8BAQdAcU7pZpPMnRXPvK0wYcPL+MuIBr9hEPapiomcm2fdVujN
 Gk9saSBaLiA8b2x6ZUB0cnVzdHNlcnYuZGU+wo8EExYIADcWIQR6SZVsmNjS6WNQOB+iUyrK
 Ql8SRAUCZw+zqgUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKJTKspCXxJEUC4A/REO
 HRLsT8uoEPbzFgS9NDjRqWsL0BcHVvUIUphCmzuZAPwPnJYjjW7rqjBs0MVT1JiXZhnNEAX1
 5yCviA39Q3Q4Bs44BGcPs6oSCisGAQQBl1UBBQEBB0BTb0Tm8TCNg3aAFJqvJIdLUgZ4pfgF
 ta8ERJwTGn4VdQMBCAfCfgQYFggAJhYhBHpJlWyY2NLpY1A4H6JTKspCXxJEBQJnD7OqBQkF
 o5qAAhsMAAoJEKJTKspCXxJEKaMBAIMk/R3PGFkwdzBLe0rrgdWPl3kaecqlb8DbW1ATf6S5
 AP0VnwztRgTqmTLQ2ffdqODLb19fwqNapedtOK8NPOq7Bw==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iu8aOp4KkWOPHzZAxnzQBYaB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iu8aOp4KkWOPHzZAxnzQBYaB
Content-Type: multipart/mixed; boundary="------------Y82sGLZFX5Hp70V3cXXNeE9Z";
 protected-headers="v1"; hp="clear"
Message-ID: <76e0c33b-475f-4533-909c-ea06d77aafb7@trustserv.de>
Date: Wed, 25 Nov 2026 20:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: ansuelsmth@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, daniel@makrotopia.org,
 hkallweit1@gmail.com
From: "Oli Z." <olze@trustserv.de>
Subject: as21xxx: AS21010 fw 1.9.1 frame-length drops (VEND1 0x103c) and,
 phantom test-pattern frames on BPI-R4 Pro
Autocrypt: addr=olze@trustserv.de; keydata=
 xjMEZw+zqhYJKwYBBAHaRw8BAQdAcU7pZpPMnRXPvK0wYcPL+MuIBr9hEPapiomcm2fdVujN
 Gk9saSBaLiA8b2x6ZUB0cnVzdHNlcnYuZGU+wo8EExYIADcWIQR6SZVsmNjS6WNQOB+iUyrK
 Ql8SRAUCZw+zqgUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKJTKspCXxJEUC4A/REO
 HRLsT8uoEPbzFgS9NDjRqWsL0BcHVvUIUphCmzuZAPwPnJYjjW7rqjBs0MVT1JiXZhnNEAX1
 5yCviA39Q3Q4Bs44BGcPs6oSCisGAQQBl1UBBQEBB0BTb0Tm8TCNg3aAFJqvJIdLUgZ4pfgF
 ta8ERJwTGn4VdQMBCAfCfgQYFggAJhYhBHpJlWyY2NLpY1A4H6JTKspCXxJEBQJnD7OqBQkF
 o5qAAhsMAAoJEKJTKspCXxJEKaMBAIMk/R3PGFkwdzBLe0rrgdWPl3kaecqlb8DbW1ATf6S5
 AP0VnwztRgTqmTLQ2ffdqODLb19fwqNapedtOK8NPOq7Bw==

--------------Y82sGLZFX5Hp70V3cXXNeE9Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuLA0KDQpJIHNlZSB0d28gcmVjZWl2ZS1zaWRlIHByb2JsZW1zIHdpdGgg
dGhlIEFTMjEwMTAgb24gdGhlIDEwRyBSSjQ1IExBTg0KcG9ydCBvZiBhIEJhbmFuYSBQaSBC
UEktUjQgUHJvIDhYLiBCb3RoIGxvb2sgbGlrZSBmaXJtd2FyZSBpc3N1ZXMsIGFuZA0KYXMg
eW91IHN1Ym1pdHRlZCB0aGUgQVMyMXgxeCBmaXJtd2FyZSB0byBsaW51eC1maXJtd2FyZSBJ
IGhvcGUgeW91IGNhbg0KcGFzcyB0aGVtIG9uIHRvIEFlb25zZW1pLg0KDQpTZXR1cDoNCi0g
QlBJLVI0IFBybyA4WCAoTVQ3OTg4QSksIGxhbi1waHkgdmFyaWFudA0KLSBNeEw4NjI1MkMg
cG9ydCAxMywgVVNYR01JSSB3aXRoIGluLWJhbmQgc3RhdHVzLCBNeEwgZmlybXdhcmUgMS4w
Ljg1DQotIEFTMjEwMTAgYXQgYWRkcmVzcyAweDE4LCBmaXJtd2FyZSAxLjkuMSAobGludXgt
ZmlybXdhcmUNCiDCoCBhZW9uc2VtaS9hczIxeDF4X2Z3LmJpbikNCi0gT3BlbldydCBtYWlu
IHIzODU1NS1mYjc0MmRlOGU1LCBrZXJuZWwgNi4xOC42NA0KLSBMaW5rIHBhcnRuZXI6IFJl
YWx0ZWsgUlRMODEyNyAocjgxNjksIHJ0bDgxMjdhLTEgMC4wLjUpLCAxMEdCQVNFLVQNCiDC
oCBvdmVyIGFib3V0IDUwIG0gb2YgaW5zdGFsbGVkIGNvcHBlciwgQVMyMTAxMCBpcyBtYXN0
ZXINCi0gVHJhZmZpYyBkaXJlY3Rpb246IGxpbmsgcGFydG5lciAtPiBBUzIxMDEwIChSSjQ1
IHJlY2VpdmUpDQoNCg0KMSkgRnJhbWUtbGVuZ3RoIGRlcGVuZGVudCBkcm9wcywgVkVORDEg
MHgxMDNjIGJpdHMgODozDQoNCkFub3RoZXIgdXNlciAoZm9ydW0gbGluayBiZWxvdykgZGlz
YXNzZW1ibGVkIGZpcm13YXJlIDEuOS4yIGFuZCBmb3VuZA0KdGhhdCBhdCAyLjVHIGFuZCBh
Ym92ZSBpdCBzZXRzIFZFTkQxIDB4MTAzYyBiaXRzIDg6MyB0byAzICg4IGJlbG93DQoyLjVH
KSwgYW5kIHRoYXQgd2l0aCAzIHRoZSBNeEwgZHJvcHMgcmVjZWl2ZWQgZnJhbWVzIGRlcGVu
ZGluZyBvbiB0aGVpcg0KbGVuZ3RoIG1vZHVsbyAxNi4gSGUgcGF0Y2hlZCB0aGUgYmluYXJ5
IHRvIHVzZSA4Lg0KDQpGaXJtd2FyZSAxLjkuMSBzZXRzIHRoZSBzYW1lIHZhbHVlIGhlcmU6
IFZFTkQxIDB4MTAzYyA9IDB4YTAxZSBhdCAxMEcuDQpJIGNoYW5nZWQgb25seSBiaXRzIDg6
MyBhdCBydW50aW1lOg0KDQogwqAgwqAgbWRpbyBtZGlvLWJ1cyBtbWQgMHgxODozMCByYXcg
MHgxMDNjIDB4YTA0Ng0KDQpVRFAsIDQgR2JpdC9zLCAyMCBzIHBlciBydW4sIGZyYW1lcyBy
ZWNlaXZlZCBvbiB0aGUgUko0NSBwb3J0Og0KDQogwqAgwqAgZnJhbWUgc2l6ZcKgIMKgZmll
bGQgPSAzIChzdG9jaynCoCDCoCDCoCBmaWVsZCA9IDgNCiDCoCDCoCAxNTE4IELCoCDCoCDC
oCDCoDAgJSBsb3NzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwLjAwMDIgJSAoMTIgb2YgNi44
IE0pDQogwqAgwqAgMTUxMCBCwqAgwqAgwqAgwqAxLjQgJSAoOTY3MTQgZnJhbWVzKcKgIMKg
MCAlDQogwqAgwqAgMTUxNCBCwqAgwqAgwqAgwqAwICXCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAwICUNCg0KTm8gY291bnRlciBvbiB0aGUgTXhMIHBvcnQgc2hvd3MgdGhlIGxv
c3QgZnJhbWVzLiBUaGUgdmFsdWUgaXMgc2V0DQpiYWNrIHRvIDMgb24gZXZlcnkgbGluay11
cCwgc28gdGhpcyBvbmx5IGxhc3RzIHVudGlsIHRoZSBuZXh0IGF1dG9uZWcuDQoNCldoYXQg
ZG9lcyB0aGlzIGZpZWxkIGNvbnRyb2wsIGFuZCBjYW4gQWVvbnNlbWkgcHJvdmlkZSBhIGZp
cm13YXJlIHdpdGgNCmEgdmFsdWUgdGhhdCB3b3JrcyB3aXRoIHRoZSBNeEw4NjI1MkMgaG9z
dCBpbnRlcmZhY2U/DQoNCg0KMikgUGhhbnRvbSA0OC1ieXRlIGZyYW1lcyB3aXRoIHZhbGlk
IENSQywgaG91cnMgYWZ0ZXIgbGluay11cA0KDQpIb3VycyBhZnRlciBhIGNsZWFuIGxpbmst
dXAgKHRvZGF5OiBmaXJzdCBDUkMgZXJyb3JzIGFmdGVyIDIgaCwgZnVsbA0KcGhhc2UgYWZ0
ZXIgNi41IGgpLCBsYW42IHN0YXJ0cyByZWNlaXZpbmcgZnJhbWVzIHRoYXQgdGhlIGxpbmsg
cGFydG5lcg0KbmV2ZXIgc2VudC4gTWVhc3VyZWQgb3ZlciB0aGUgc2FtZSAxMCBzIG9uIGJv
dGggZW5kczoNCg0KIMKgIMKgIGxpbmsgcGFydG5lciB0eF9wYWNrZXRzIChyODE2OSBNQUMp
wqAgwqAgwqAgwqAgwqAgMTcyDQogwqAgwqAgbGFuNiBldGgtbWFjLUZyYW1lc1JlY2VpdmVk
T0vCoCDCoCDCoCDCoCDCoCDCoCDCoCAxODczNA0KIMKgIMKgIGxhbjYgcm1vbi1ldGhlclN0
YXRzVW5kZXJzaXplUGt0c8KgIMKgIMKgIMKgIMKgIDE4NTg3DQoNCkV2ZXJ5IG9uZSBvZiB0
aGVtIGlzIHRoZSBzYW1lIGZyYW1lLiBBcyBjYXB0dXJlZCBvbiB0aGUgQ1BVIHBvcnQsIGFm
dGVyDQp0aGUgc3dpdGNoIGFkZGVkIHRoZSBQVklEIDIwIHRhZzoNCg0KIMKgIMKgIDAwOjAw
OjAxOjAxOjAxOjAxID4gMDA6MDA6MDA6MDA6MDA6MDAsIDgwMi4xUSB2bGFuIDIwLCBsZW5n
dGggNTYNCiDCoCDCoCAweDAwMDA6wqAgMDEwMSAwMjAyIDAyMDIgMDIwMiAwMjAyIDAzMDMg
MDMwMyAwMzAzDQogwqAgwqAgMHgwMDEwOsKgIDAzMDMgMDQwNCAwNDA0IDA0MDQgMDQwNCAw
NTA1IDA1MDUgZmU1YQ0KIMKgIMKgIDB4MDAyMDrCoCBiZjQ3IDAwMDAgMDAwMA0KDQpXaXRo
b3V0IHRoZSBWTEFOIHRhZyB0aGUgZnJhbWUgaXMgOCBieXRlcyBlYWNoIG9mIDAwLCAwMSwg
MDIsIDAzLCAwNCwNCnRoZW4gNCBieXRlcyBvZiAwNSAoNDQgYnl0ZXMpLCBmb2xsb3dlZCBi
eSBmZSA1YSBiZiA0Nywgd2hpY2ggaXMgdGhlDQpjb3JyZWN0IENSQzMyIChsaXR0bGUtZW5k
aWFuKSBvZiB0aG9zZSA0NCBieXRlcy4NCg0KLSBSYXRlOiBidXJzdHMgb2YgYWJvdXQgMzcg
ZnJhbWVzIHdpdGhpbiAwLjUgbXMsIGV2ZXJ5IDEwIHRvIDQ1IG1zLA0KIMKgIGFib3V0IDE4
NTAgZnJhbWVzL3MsIGluZGVwZW5kZW50IG9mIHRoZSByZWFsIHRyYWZmaWMuDQotIE9ubHkg
dGhlIFJKNDUgcmVjZWl2ZSBkaXJlY3Rpb24gaXMgYWZmZWN0ZWQ7IHRoZSBvdGhlciBkaXJl
Y3Rpb24NCiDCoCBjb3VudHMgbWF0Y2guDQotIFdoaWxlIGl0IHJ1bnMsIHJ4X2Ryb3BwZWQg
b24gbGFuNiBjbGltYnMgYnkgdXAgdG8gMi40IE0gcGVyIG1pbnV0ZQ0KIMKgIGFuZCB0aHJv
dWdocHV0IGZhbGxzIGZyb20gOS4zIEdiaXQvcyB0byBhYm91dCAxIEdiaXQvcyBkb3duIGFu
ZA0KIMKgIDEzMCBNYml0L3MgdXAuDQotIFBhdXNlIGZyYW1lcyBzdGF5IGF0IDAgb24gYm90
aCBzaWRlczsgTXhMIHRlbXBlcmF0dXJlIGlzIGZsYXQgYXQNCiDCoCBhYm91dCA2MCBDLg0K
LSAiZXRodG9vbCAtciBsYW42IiBzdG9wcyBpdCBhdCBvbmNlLCB1bnRpbCB0aGUgbmV4dCBw
aGFzZS4NCi0gVGhlIHNhbWUgbGluayBwYXJ0bmVyIGhhZCBubyBzdWNoIHBoYXNlcyB3aGVu
IGl0IHdhcyBjb25uZWN0ZWQgdG8gYW4NCiDCoCBTRlArIDEwR0JBU0UtVCBtb2R1bGUgb24g
YSBCUEktUjQgKG5vbi1Qcm8pLg0KDQpBIHZhbGlkIENSQyBvdmVyIGFuIGluY3JlbWVudGlu
ZyA4LWJ5dGUgcGF0dGVybiBkb2VzIG5vdCBsb29rIGxpa2UNCmxpbmUgZXJyb3JzOyBpdCBs
b29rcyBsaWtlIGEgZnJhbWUgZ2VuZXJhdG9yLCBhbmQgdGhlIEFTMjEwMTAgaGFzIGEgTUFD
DQpvZiBpdHMgb3duIChzZWUgdGhlIDB4MTAzYyBmaWVsZCkuIERvZXMgdGhlIGZpcm13YXJl
IGNvbnRhaW4gYQ0KdGVzdC1mcmFtZSBvciBwYWNrZXQgZ2VuZXJhdG9yIHdpdGggdGhpcyBw
YXR0ZXJuLCBhbmQgd2hhdCBjb3VsZA0KZW5hYmxlIGl0IGR1cmluZyBub3JtYWwgb3BlcmF0
aW9uPyBBIHBjYXAgd2l0aCB0aGVzZSBmcmFtZXMgaXMNCmF2YWlsYWJsZSBpZiB1c2VmdWwu
DQoNClRoaXMgcGhhc2UgaGFwcGVuZWQgd2l0aCB0aGUgc3RvY2sgMHgxMDNjIHZhbHVlIDMu
IEkgbm93IHJ1biB3aXRoIDggdG8NCnNlZSB3aGV0aGVyIHRoZSBwaGFzZXMgYXJlIHJlbGF0
ZWQgdG8gcHJvYmxlbSAxLg0KDQoNClNpZGUgbm90ZTogcmVhZGluZyBDNDUgcmVnaXN0ZXJz
IG9mIHRoZSBBUzIxMDEwIHdpdGggbWRpby10b29scyBvbg0KdGhpcyBib2FyZCwgZXZlcnkg
cmVhZCByZXR1cm5zIHRoZSB2YWx1ZSBvZiB0aGUgcHJldmlvdXMgcmVhZCAodGhlDQpmaXJz
dCByZWFkIGFmdGVyIGFub3RoZXIgcmVnaXN0ZXIgc2hvd3MgdGhhdCByZWdpc3RlcidzIHZh
bHVlKS4gSSBoYXZlDQpub3QgY2hlY2tlZCB3aGV0aGVyIHRoaXMgaXMgbWRpby1uZXRsaW5r
IG9yIHRoZSBNRElPIGJ1cy4NCg0KRm9ydW0gdGhyZWFkIHdpdGggdGhlIDB4MTAzYyBhbmFs
eXNpczoNCmh0dHBzOi8vZm9ydW0uYmFuYW5hLXBpLm9yZy90L3Bvc3NpYmxlLWZpcm13YXJl
LWlzc3VlLW9uLXRoZS1icGktcjQtcHJvLXN3aXRjaGVkLTEwZ2Jwcy1wb3J0LzI4NDgyDQoN
ClRoYW5rcywNCk9saQ0KDQo=

--------------Y82sGLZFX5Hp70V3cXXNeE9Z--

--------------iu8aOp4KkWOPHzZAxnzQBYaB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQR6SZVsmNjS6WNQOB+iUyrKQl8SRAUCawc6EAUDAAAAAAAKCRCiUyrKQl8SRACL
AQDmj4Yl+n4AamTOekdGn+UwCj2VDWV15IxpyyXLmIwhpgD/ZHlkUO33cc5ETRdo/56dxI4aUeEK
SS3VsYWceB5crw4=
=GVhy
-----END PGP SIGNATURE-----

--------------iu8aOp4KkWOPHzZAxnzQBYaB--
