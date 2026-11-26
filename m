Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653386;
	b=S1twyMY0kc3KFjC5NjrlpDCDiGnNbcSZKMoz9miFN+p0dM66y+o8S2yf8e3DnZgiZMU7
	 MskicfoDzBL0EKRQKphXKjwBCC/DIpJeQgQ83AezqYsyC5AzexJyO/W7ExpZWe6GymRmH
	 9pM54YDXcKwngyc/tWm1XO9/p3Zo8zYkNhEykHqmKFqNqyO7KL2SyBWratGWdCykvV4CQ
	 V13Z8hu7Sc79kUWw83nzCuvryaqPeFClaGX0IuEfPtIQHIuAHcvoiMtpqIw7G1DjpAPJG
	 l/9wF+pmsmjphBffWMn7aMxq+tdvqbDaosgSSVl08WH89txnUJ1q8rjz6ABh5aMUEJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=leTH11cRkWlEx3eKCDzdDOiVWds2rTNM3oIqU+/F4m4=;
	b=uBsFF3lvm3FMxDT3j3oYU8yoEluO483o1BRm+r1pf4w+1Y8TlefFMZ8NTjNG/mg7smCs
	 gHOpScHmjZ+au0zK3r7JYJCH88wRQpzWexjATdlyQVSeFwrTF0br11FWGyqp65Aig5A6x
	 5JI7Xn+B8txefoChmtBaqwd9phgYe6rAFlsnTKwemc5MqIoHwloSCoGShPhuKHS6UY9nT
	 e/XOzXlOTc7rcIMLjaIiyRNCCwSp2Hhjef4rmIVp/KeColpEyNS5bMIEOlR0I4+KF7YJh
	 saC66s+k5LhrLsEUhYmnmjaUJr0La4J+CJZXnuoUXCsn5rZDmz+vySh5iSyPoOjcTLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epAdVCH5;
	arc=none smtp.remote-ip=209.85.219.72
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB3606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epAdVCH5
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso120897466d6.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653384; x=1796258184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=leTH11cRkWlEx3eKCDzdDOiVWds2rTNM3oIqU+/F4m4=;
        b=epAdVCH53RPND2blMzJMcbLhmSP+saCirEdjwWhkSIeID6PVTlkh6trdG2AQMjr+4R
         rYukNu22VsMhPYEkWoh95MaNJs1Pr1J12xFqY0fjBCLeuKtROeh5+2oKeyAscuRJGJ7h
         t5r6cPFOIGkzuD68JCbNIW1Z2W7fn7N+dd0LGO0MeIRZiA+iDuSTYfyEb0RCLD7KhLJi
         BpbFg6o3z3vp82nMqEEAbvfrz1ZV9k/I0KDAPBwk7wcGNErQfye3C9vrOVKDbdtoX1si
         oOS/bJBFhzrBVHNQ6UiAClZFQoOOGAMS0sFWN1ITh2ihvCVw56Wna/9Hh3/m81inTW7W
         IgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653384; x=1796258184;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leTH11cRkWlEx3eKCDzdDOiVWds2rTNM3oIqU+/F4m4=;
        b=ozj3GKZeMG0pXKv8rDRtFRkGjqjfDGe5hx7FybKsfJNtiweyJnbLhSPTeZ5jSCb1qT
         WB2OwQhY0a7hjVYUE/HH7xNlY9odcY1MQvPaRxmrnCIDpcfKXct1/bnUJ0mslPuonidM
         9dg7tPXBkO3sXSWiXU4nsXSpylmKXmYdWPjS+WZFyasQVNUPaFw5DvetKv991lBq9h0N
         0yufhRCt23chEZWXeAMMK1w0GKtjL59NlidmrDoF23R33opOPokrm+5S1JeghAS//ZN8
         5Bn68RXIoOVsmMZobtHzvlFqhadkjZhaum8PlWQwNJaGZzxXGY6fYiauv9d+WbPFEzP8
         uDBQ==
X-Gm-Message-State: APuU4Z++t/yjJ/EacAZesgcR9BNqctnH0YSMszz+sJkvifWgEvX3LzB8
	d0wgxbRvgcBMcnqGkjxlBmwNL+s5f2IujdpCXyWpvzy+wPWreaZHwRUhQ0UDMnrd38SZzIavXN8
	yk27EHvLV8A==
X-Received: from qvbgg3.prod.google.com ([2002:a05:6214:2523:b0:920:ffaf:d964])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:8018:b0:91f:2222:b498
 with SMTP id 6a1803df08f44-92134b20d5amr285057826d6.27.1795653384183; Wed, 25
 Nov 2026 16:36:24 -0800 (PST)
Date: Wed, 25 Nov 2026 19:36:23 -0500
In-Reply-To: <38460544-04f5-41e0-b267-39c155bb08bb@blackwall.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121160204.4024204-1-razor@blackwall.org> <179548941922.3135.9577858774980848901@kernel.org>
 <38460544-04f5-41e0-b267-39c155bb08bb@blackwall.org>
Message-ID: <willemb.1b39ecea58ba6@google.com>
Subject: Re: [PATCH net] net: keep skbs with a prefetched socket out of
 gro_cells gro
From: willemb@google.com
To: Nikolay Aleksandrov <razor@blackwall.org>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org, 
	kafai@fb.com, joe@wand.net.nz, daniel@iogearbox.net, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

Tmlrb2xheSBBbGVrc2FuZHJvdiB3cm90ZToNCj4gT24gMjQvMTEvMjAyNiAwNTowMywgbmV0ZGV2
LWJvdCtzYXNoaWtvQGtlcm5lbC5vcmcgd3JvdGU6DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNv
bnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gPiBpc3N1
ZShzKSB0byBjb25zaWRlci4NCj4gPg0KPiA+IENyaXRpY2FsOiAwIMK3IEhpZ2g6IDEgwrcgTWVk
aXVtOiAwIMK3IExvdzogMA0KPiA+DQo+ID4gSWYgeW91IGJlbGlldmUgbm9uZSBvZiB0aGUgaXNz
dWVzIGFyZSBsZWdpdGltYXRlLCBwbGVhc2UgcmVwbHkgdG8gZWFjaA0KPiA+IGlzc3VlIG9mIE1l
ZGl1bSBzZXZlcml0eSBvciBoaWdoZXIgYW5kIGV4cGxhaW4gd2h5IHRoZSBBSSBpcyB3cm9uZy4N
Cj4gPiBJZiBhbnkgb2YgdGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGlu
LCBwbGVhc2UgbGV0ICANCj4gcGF0Y2h3b3JrDQo+ID4ga25vdyBieSBpbmNsdWRpbmcgInB3LWJv
dDogY3IiIGFzIGEgc2VwYXJhdGUgbGluZSBhdCB0aGUgZW5kIG9mIHlvdXIgIA0KPiByZXBseQ0K
PiA+IChvbmUgc3VjaCByZXBseSBwZXIgc2VyaWVzIGlzIGVub3VnaCkuDQo+ID4NCj4gPiAtIFtI
aWdoXSBUaGUgZml4IGlzIGluY29tcGxldGUuDQo+ID4NCj4gPiAtLQ0KPiA+DQo+ID4gbmV0OiBr
ZWVwIHNrYnMgd2l0aCBhIHByZWZldGNoZWQgc29ja2V0IG91dCBvZiBncm9fY2VsbHMgZ3JvDQo+
ID4NCj4gPiBUaGlzIHBhdGNoIG1ha2VzIGdyb19jZWxsc19yZWNlaXZlKCkgc2VuZCBza2JzIHRo
YXQgY2FycnkgYSBwcmVmZXRjaGVkDQo+ID4gc29ja2V0IGZyb20gYnBmX3NrX2Fzc2lnbigpIHRv
IG5ldGlmX3J4KCkgaW5zdGVhZCBvZiB0aGUgR1JPIGNlbGwuIFRoZQ0KPiA+IGdvYWwgaXMgdG8g
c3RvcCBHUk8gZnJvbSBjbGVhcmluZyBza2ItPnNrIGFuZCBza2ItPmRlc3RydWN0b3Igb24gbWVy
Z2VkDQo+ID4gc2ticywgd2hpY2ggbGVha3Mgb25lIHNvY2tldCByZWZlcmVuY2UgcGVyIG1lcmdl
ZCBza2IuDQo+ID4NCj4gPj4gZGlmZiAtLWdpdCBhL25ldC9jb3JlL2dyb19jZWxscy5jIGIvbmV0
L2NvcmUvZ3JvX2NlbGxzLmMNCj4gPj4gaW5kZXggMzEzNTJjYWMzNTVjZS4uNGU4YjljM2NkN2Rh
MCAxMDA2NDQNCj4gPj4gLS0tIGEvbmV0L2NvcmUvZ3JvX2NlbGxzLmMNCj4gPj4gKysrIGIvbmV0
L2NvcmUvZ3JvX2NlbGxzLmMNCj4gPg0KPiA+IFsgLi4uIF0NCj4gPg0KPiA+PiBAQCAtMjYsNyAr
MjcsOCBAQCBpbnQgZ3JvX2NlbGxzX3JlY2VpdmUoc3RydWN0IGdyb19jZWxscyAqZ2NlbGxzLCAg
DQo+IHN0cnVjdCBza19idWZmICpza2IpDQo+ID4+DQo+ID4+ICAgCXNrYl91bnNldF90cmFuc3Bv
cnRfaGVhZGVyKHNrYik7DQo+ID4+DQo+ID4+IC0JaWYgKCFnY2VsbHMtPmNlbGxzIHx8IHNrYl9j
bG9uZWQoc2tiKSB8fCBuZXRpZl9lbGlkZV9ncm8oZGV2KSkgew0KPiA+PiArCWlmICghZ2NlbGxz
LT5jZWxscyB8fCBza2JfY2xvbmVkKHNrYikgfHwgbmV0aWZfZWxpZGVfZ3JvKGRldikgfHwNCj4g
Pj4gKwkgICAgdW5saWtlbHkoc2tiX3NrX2lzX3ByZWZldGNoZWQoc2tiKSkpIHsNCj4gPg0KPiA+
IFtTZXZlcml0eTogSGlnaF0NCj4gPiBJcyBtYXRjaGluZyBvbmx5IHNrYi0+ZGVzdHJ1Y3RvciA9
PSBzb2NrX3BmcmVlIGVub3VnaCBoZXJlPyBBbiBza2IgdGhhdA0KPiA+IGdvdCBpdHMgc29ja2V0
IGZyb20gYnBmX3NrX2Fzc2lnbigpIGNhbiBzdGlsbCByZWFjaCBncm9fY2VsbHNfcmVjZWl2ZSgp
DQo+ID4gd2l0aCBhIGRpZmZlcmVudCBkZXN0cnVjdG9yIHRoYXQgb3ducyBvbmUgc2tfcmVmY250
IHJlZmVyZW5jZSBwZXIgc2tiLg0KPiA+DQo+ID4gT25lIHBhdGg6IGJwZl9za19hc3NpZ24oKSBh
dCB0YyBpbmdyZXNzIGF0dGFjaGVzIGEgbm9uLXJlZmNvdW50ZWQgIA0KPiBzb2NrZXQsDQo+ID4g
c3VjaCBhcyBhIFRDUCBsaXN0ZW5lciBvciBhIFVEUCBzb2NrZXQuIEl0IHNldHMgc29ja19wZnJl
ZSBhbmQgdGFrZXMgbm8NCj4gPiByZWZlcmVuY2UuIGlwX3Jjdl9jb3JlKCkga2VlcHMgaXQuIFRo
ZW4gYW4gTkZRVUVVRSBydWxlIG1hdGNoZXMgdGhlICANCj4gb3V0ZXINCj4gPiBpcGlwL2dyZS9l
c3AgcGFja2V0LCBhbmQgX19uZl9xdWV1ZSgpIGNvbnZlcnRzIGl0Og0KPiA+DQoNCj4gT2ggd2Vs
bCB0aGUgYm90IHNlZW1zIHJpZ2h0IGV2ZW4gdGhvdWdoIGl0J3MgYSB3ZWlyZCBjYXNlLCBJJ2Qg
c3VnZ2VzdCB0byAgDQo+IGNoYW5nZQ0KPiB0aGUgY2hlY2sgYW5kIG9ycGhhbiBvbiBhbnkgc2ti
LT5zayBzZXQsIGkuZS46IHx8IHVubGlrZWx5KHNrYi0+c2spDQo+IGluc3RlYWQgb2YgdW5saWtl
bHkoc2tiX3NrX2lzX3ByZWZldGNoZWQoc2tiKSksIHRoYXQgaXMgY2FjaGUgaG90IHRvbyBhcw0K
PiBza2ItPmRldiBpcyByZWFkIGJlZm9yZSBhbmQgd2lsbCBjYXRjaA0KDQo+IEFsc28gdHJpZWQg
YXNraW5nIGFuIExMTSBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmcgYW5kIHRoZSBvbmx5IGNhc2Ug
aXQgIA0KPiBjb3VsZCBjb21lIHVwDQo+IHRoYXQgd2lsbCBub3QgYmUgYWdncmVnYXRlZCBpczoN
Cj4gInRoZSBvbmx5IGNvcnJlY3QgYWdncmVnYXRpb24gdGhhdCdzIGxvc3QgaXMgc29mdHdhcmUg
RVNQIG92ZXIgdmV0aCBvciAgDQo+IG5ldGRldnNpbSBpbiB0dW5uZWwgbW9kZSINCj4gSU1PIHRo
YXQgaXMgb2suDQoNCj4gV2hhdCBkbyB5b3UgdGhpbms/DQoNClRoaXMgYWxzbyBhZmZlY3RzIEVT
UCBvdmVyIHR1bnRhcCB3aXRoIElGRl9OQVBJLiBCdXQgdGhhdCBpcyBub3QgYSBjb21tb24NCnBy
b2R1Y3Rpb24gY29uZmlndXJhdGlvbi4NCg0KU28gTEdUTS4NCg0KSnVzdCBhIHNtYWxsIG5vdGUg
dGhhdCByZWRpcmVjdCB0byBuZXRpZl9yeCAhPSBvcnBoYW4uIE5vIG5lZWQgdG8gb3JwaGFuLg0K
