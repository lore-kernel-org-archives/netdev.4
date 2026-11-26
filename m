Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652494;
	b=jtk39AOaZN6bHzwzaYGbc6o83ioq9rHQLtKX04lyeoiz76QPs92o1znzk5NOkE/8bNLY
	 m/LVp0AZAKmIQwf6jAdpfKOc3GEDQVIzL/OIsuEw7pqaoqdQMVzxKkPtSGxi7vaRPi4mc
	 hDN4x7PeyWq8xkGJ52oWcMQpFBFtx4P/oU059rqOQYHSBxpt+ZjENd2ItGQRJ621LjiSJ
	 wB2eP0SYnhMLedVeUSszPFBQ6vlVtF+xBHj/K7Ce5xLvhmzZ4TC8H022hzrR4WKFFIDh2
	 eii3xkZOdjs9Oi+cGXQkcMjgbFvkX75eKIFPq/QJ0BIigzomjNYLV/4ZOVoKTbZAQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=dc/F7/hT52S+GWZn1h1x6UM/KO7qiTpd9NPpDZQkRLU=;
	b=djH1Ls5l4M9G4+YDXd1OU/+7+12jBzZXPQAiLwFG6tmmFpAFcDNIvtVwscRNokS/Z0XB
	 r5AvwZIv4UmVmUvKSft3eOtaY7JXqeKDB8vdeDN8O9QrBvm1MZ2xBf72cDkGCMLPvohC4
	 zFXOG5AM1wevSNCqOeYWWjuQwW9kuTEZG8hyPRnQc6If06QTthj5n96nQJyB78jTrvFc0
	 Za1EkPVC/WjHPz6JbznB7NzVYv1AY2FQMlQhRcC6yEUqYgfSkdo2aYW7L8lpEbwRn2qsw
	 x/d769SHoSx8O4Il/6UjKXUxjPIT00V5tEphlV8hdqZzHovvg/wuMpZOxTXLZQ9GBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pk+H8jdy;
	arc=none smtp.remote-ip=74.125.224.69
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A5606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pk+H8jdy
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6799288480dso9295150d50.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795652493; x=1796257293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dc/F7/hT52S+GWZn1h1x6UM/KO7qiTpd9NPpDZQkRLU=;
        b=Pk+H8jdypoo6U8Y3RDJ71kVo3WGv7/dRSnuZx9jNY4DAsGeVLMluLeqN44pvczLHuk
         aljUCpTXgdXY8+kkBejRIR3VXYgqB8sWj+oi5ocz5BRYy4tzb8Nk2BmHG0zdSKqzgwpN
         oRu936tUMrKoNp6UhH2Hz5FpQI5d09JCJLgbbFhNw919eQOjCZVf4c8RYL+AXlRNlR7U
         ioLsgOodMWk+mupdCEr8Q/z0J58GbAwXWisMw1171aREKeYwThSbxf1Ol/dRpmHlqSxS
         FwPk/4rvuHcA4W/GRu5u785ZdcLnkdRYohfN5SHIwwqIaZ3iVJicsNF4tXwEQiVuBO2z
         cQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652493; x=1796257293;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dc/F7/hT52S+GWZn1h1x6UM/KO7qiTpd9NPpDZQkRLU=;
        b=nKt9t3TUYKGRgkpTXP9ljRyiXNLY0SDKb08CwvzAg0zkAqC83cfRBvD1MP6xzwj0N2
         VVHbmXhSmpToko5lOYVlIWSjEKANyP46Yu/SuWfAPK6D7JrIfUgvIXPwEkqlMMWBY/qI
         XCU4jVh90A9HgwgoEQyVPNLDLUhuGkvjlegVHr+kaoVoxYeB33+XFh+hkCL5jX5mBDSz
         RFjkuq+O2n7tTxoX0GxPP8Zif+AuT/C3vRZj0akARlrh/X5pBkou7swIlttZR1cRNnHn
         PSs9Nrxo/VOjPa0eatYfuj+hboz8tX9H55Gc+PmG4XRv7KaxMghV1OdaZkNRnbvu2tJG
         FffA==
X-Gm-Message-State: APuU4Z8K2XzouSTuHyw3n0jozsf41NdZJHeZt5Ao1lvovBLVA8vNzs6c
	cCee/mdU96uD8CysIlalTVMHyObK1O6aeuGqZC/WCu1OxOdfWAd/rS1spqfRioHj5/7IegJZ9SI
	S3bSYT/PKGQ==
X-Received: from yxqs11.prod.google.com ([2002:a53:c78b:0:b0:67b:ef48:3a14])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:4514:20b0:67d:babd:b7f5
 with SMTP id 956f58d0204a3-67df449b687mr4618019d50.68.1795652492982; Wed, 25
 Nov 2026 16:21:32 -0800 (PST)
Date: Wed, 25 Nov 2026 19:21:31 -0500
In-Reply-To: <awTJWtBSMubj4qQ9@devvm20253.cco0.facebook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120152830.699712-6-joe@dama.to> <179545866419.3135.14423996277439097165@kernel.org>
 <awTJWtBSMubj4qQ9@devvm20253.cco0.facebook.com>
Message-ID: <willemb.1401f0f6ad765@google.com>
Subject: Re: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
From: willemb@google.com
To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	prashant@broadcom.com, edumazet@google.com, horms@kernel.org, 
	selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

Sm9lIERhbWF0byB3cm90ZToNCj4gT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMDY6MzE6MDRQTSAr
MDAwMCwgbmV0ZGV2LWJvdCtzYXNoaWtvQGtlcm5lbC5vcmcgIA0KPiB3cm90ZToNCj4gPiBUaGFu
ayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCA2IHBv
dGVudGlhbA0KPiA+IGlzc3VlKHMpIHRvIGNvbnNpZGVyLg0KPiA+DQo+ID4gQ3JpdGljYWw6IDAg
wrcgSGlnaDogMyDCtyBNZWRpdW06IDMgwrcgTG93OiAwDQo+ID4NCj4gPiBJZiB5b3UgYmVsaWV2
ZSBub25lIG9mIHRoZSBpc3N1ZXMgYXJlIGxlZ2l0aW1hdGUsIHBsZWFzZSByZXBseSB0byBlYWNo
DQo+ID4gaXNzdWUgb2YgTWVkaXVtIHNldmVyaXR5IG9yIGhpZ2hlciBhbmQgZXhwbGFpbiB3aHkg
dGhlIEFJIGlzIHdyb25nLg0KPiA+IElmIGFueSBvZiB0aGVtIGFyZSBsZWdpdGltYXRlIGFuZCB5
b3UgcGxhbiB0byByZXNwaW4sIHBsZWFzZSBsZXQgIA0KPiBwYXRjaHdvcmsNCj4gPiBrbm93IGJ5
IGluY2x1ZGluZyAicHctYm90OiBjciIgYXMgYSBzZXBhcmF0ZSBsaW5lIGF0IHRoZSBlbmQgb2Yg
eW91ciAgDQo+IHJlcGx5DQo+ID4gKG9uZSBzdWNoIHJlcGx5IHBlciBzZXJpZXMgaXMgZW5vdWdo
KS4NCj4gPg0KPiA+IC0gW0hpZ2hdIFBvc3NpYmxlIGRlYWRsb2NrLg0KPiA+IC0gW0hpZ2hdIGJu
eHRfcmVzZXQoKSBkZWNpZGVzIHRvIGNhbGwgYm54dF91bHBfc3RhcnQoKSBvbmx5IGZyb20gIXNp
bGVudA0KPiA+ICAgJiYgIUJOWFRfU1RBVEVfRE1BX1NUT1BQRUQsIGFmdGVyIGRyb3BwaW5nIGl0
cyBsb2Nrcy4NCj4gPiAtIFtIaWdoXSBJbmNvbXBsZXRlIGZpeC4NCj4gPiAtIFtNZWRpdW1dIGJu
eHRfcmVzZXRfdGFzaygpIGRpc2NhcmRzIHRoZSByZXR1cm4gdmFsdWUgb2YNCj4gPiAgIGJueHRf
b3Blbl9uaWMoKSwgYW5kIGJueHRfcmVzZXQoKSBjYWxscyBibnh0X3VscF9zdGFydCgpIHdoZW5l
dmVy4oCmDQo+ID4gLSBbTWVkaXVtXSBUaGUgbmV3IERNQV9TVE9QUEVEIGNoZWNrIGV4aXN0cyBv
bmx5IGF0IHRoZSBibnh0X3Jlc2V0KCkgIA0KPiBjYWxsDQo+ID4gICBzaXRlLg0KPiA+IC0gW01l
ZGl1bV0gRXZlcnkgbm9uLXNpbGVudCByZXNldCBub3cgdW5yZWdpc3RlcnMgYW5kIHJlLXJlZ2lz
dGVycyB0aGUNCj4gPiAgIFJvQ0UgSUIgZGV2aWNlLCBpbmNsdWRpbmcgdGhlIGNvbW1vbiBjYXNl
IHdoZXJlIERNQSBpcyBuZXZlciBzdG9wcGVkLOKApg0KPiA+DQo+ID4gLS0NCj4gPg0KPiA+IGJu
eHRfZW46IHN0b3AgdGhlIFVMUCBhcm91bmQgdGhlIHJlc2V0IHRhc2sNCj4gPg0KPiA+IEZvciBu
b24tc2lsZW50IHJlc2V0cywgYm54dF9yZXNldCgpIG5vdyBjYWxscyBibnh0X3VscF9zdG9wKCkg
YmVmb3JlIGl0DQo+ID4gdGFrZXMgcnRubCBhbmQgdGhlIG5ldGRldiBsb2NrLiBBZnRlcndhcmRz
IGl0IGNhbGxzIGJueHRfdWxwX3N0YXJ0KCkgIA0KPiB1bmxlc3MNCj4gPiBCTlhUX1NUQVRFX0RN
QV9TVE9QUEVEIHdhcyBzZXQuIFRoZSBnb2FsIGlzIHRvIGtlZXAgdGhlIFJETUEgZHJpdmVyIG9m
ZiAgDQo+IHRoZQ0KPiA+IGRldmljZSBvbmNlIHRoZSByZXNldCB0YXNrIGhhcyBzdG9wcGVkIERN
QS4NCj4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29t
L2JueHQvYm54dC5jICANCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9ibnh0L2Ju
eHQuYw0KPiA+ID4gaW5kZXggOWRhZjA1MzI5M2E0Mi4uMmFiYjcyMWQ4N2RlOCAxMDA2NDQNCj4g
PiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2JueHQvYm54dC5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9ibnh0L2JueHQuYw0KPiA+ID4g
QEAgLTE0NzEwLDEwICsxNDcxMCwxNCBAQCBzdGF0aWMgdm9pZCBibnh0X3RwaF91cGRhdGUoc3Ry
dWN0IGJueHQgKmJwKQ0KPiA+ID4gIC8qIE9ubHkgY2FsbGVkIGZyb20gYm54dF9zcF90YXNrKCkg
Ki8NCj4gPiA+ICBzdGF0aWMgdm9pZCBibnh0X3Jlc2V0KHN0cnVjdCBibnh0ICpicCwgYm9vbCBz
aWxlbnQpDQo+ID4gPiAgew0KPiA+ID4gKwlpZiAoIXNpbGVudCkNCj4gPiA+ICsJCWJueHRfdWxw
X3N0b3AoYnApOw0KPiA+ID4gIAlibnh0X3J0bmxfbG9ja19zcChicCk7DQo+ID4NCj4gPiBbU2V2
ZXJpdHk6IEhpZ2hdDQo+ID4gQ2FuIHRoaXMgZGVhZGxvY2sgYWdhaW5zdCBibnh0X2Nsb3NlKCk/
DQo+ID4NCj4gPiBibnh0X3NwX3Rhc2soKSBzZXRzIEJOWFRfU1RBVEVfSU5fU1BfVEFTSyBiZWZv
cmUgaXQgY2FsbHMgYm54dF9yZXNldCgpLg0KPiA+IGJueHRfcnRubF9sb2NrX3NwKCkgY2xlYXJz
IHRoYXQgYml0IG9ubHkgYWZ0ZXIgYm54dF91bHBfc3RvcCgpIGhhcw0KPiA+IHJldHVybmVkLCBh
bmQgYm54dF9ydG5sX3VubG9ja19zcCgpIHNldHMgaXQgYWdhaW4gYmVmb3JlICANCj4gYm54dF91
bHBfc3RhcnQoKQ0KPiA+IHJ1bnMuIFNvIGJvdGggbmV3IFVMUCBjYWxscyBydW4gd2l0aCBJTl9T
UF9UQVNLIHNldC4NCj4gPg0KPiA+IEJvdGggVUxQIGNhbGxiYWNrcyB0YWtlIHJ0bmxfbG9jaygp
Og0KPiA+DQo+ID4gYm54dF91bHBfc3RvcCgpDQo+ID4gICBibnh0X3JlX3N1c3BlbmQoKQ0KPiA+
ICAgICBibnh0X3JlX3VwZGF0ZV9lbl9pbmZvX3JkZXYoKQ0KPiA+ICAgICAgIHJ0bmxfbG9jaygp
DQo+ID4NCj4gPiBibnh0X3VscF9zdGFydCgpDQo+ID4gICBibnh0X3JlX3Jlc3VtZSgpDQo+ID4g
ICAgIGJueHRfcmVfYWRkX2RldmljZSgpDQo+ID4gICAgICAgYm54dF9yZV91cGRhdGVfZW5faW5m
b19yZGV2KCkNCj4gPiAgICAgICAgIHJ0bmxfbG9jaygpDQo+ID4gICAgICAgIA0KPiBibnh0X3Jl
X2liX2luaXQoKS0+aWJfcmVnaXN0ZXJfZGV2aWNlKCktPi4uLi0+ZW51bV9hbGxfZ2lkc19vZl9k
ZXZfY2IoKQ0KPiA+ICAgICAgICAgcnRubF9sb2NrKCkNCj4gPg0KPiA+IG5kb19zdG9wLCBtZWFu
d2hpbGUsIGhvbGRzIHJ0bmwgYW5kIHRoZSBuZXRkZXYgaW5zdGFuY2UgbG9jayBhbmQgd2FpdHMg
IA0KPiBmb3INCj4gPiBJTl9TUF9UQVNLIHRvIGNsZWFyLCB3aXRoIG5vIHRpbWVvdXQ6DQo+ID4N
Cj4gPiBfX2JueHRfY2xvc2VfbmljKCkgew0KPiA+IAljbGVhcl9iaXQoQk5YVF9TVEFURV9PUEVO
LCAmYnAtPnN0YXRlKTsNCj4gPiAJc21wX21iX19hZnRlcl9hdG9taWMoKTsNCj4gPiAJd2hpbGUg
KGJueHRfZHJ2X2J1c3koYnApKQ0KPiA+IAkJbXNsZWVwKDIwKTsNCj4gPiAJLi4uDQo+ID4gfQ0K
PiA+DQo+ID4gU3VwcG9zZSAiaXAgbGluayBzZXQgZGV2IFggZG93biIgcnVucyBqdXN0IGFmdGVy
IGEgVFggdGltZW91dCBoYXMgIA0KPiBzY2hlZHVsZWQNCj4gPiBCTlhUX1JFU0VUX1RBU0tfU1Bf
RVZFTlQuIHNwX3Rhc2sgY2FuIGJsb2NrIG9uIHJ0bmwgaW5zaWRlICANCj4gYm54dF91bHBfc3Rv
cCgpDQo+ID4gKG9yIGJueHRfdWxwX3N0YXJ0KCkpLCB3aGlsZSBibnh0X2Nsb3NlKCkgc3BpbnMg
b24gYm54dF9kcnZfYnVzeSgpICANCj4gaG9sZGluZw0KPiA+IHJ0bmwuIFRoZSBjb21tZW50IGFi
b3ZlIGJueHRfbG9ja19zcCgpIHdhcm5zIGFib3V0IHRoaXMgZXhhY3QgY2FzZS4NCj4gPg0KPiA+
IEJlZm9yZSB0aGlzIHBhdGNoLCBvbmx5IHRoZSByYXJlIFJFU1RBUlRfVUxQIGFuZCBmaXJtd2Fy
ZSByZXNldCBldmVudHMNCj4gPiBjYWxsZWQgaW50byB0aGUgVUxQIHdpdGggSU5fU1BfVEFTSyBz
ZXQuIFRoZSBmcmVxdWVudCByZXNldCBwYXRoIGRpZCAgDQo+IG5vdC4NCj4gPg0KPiA+IFNob3Vs
ZCB0aGUgVUxQIGNhbGxzIGhhcHBlbiBvbmx5IHdoaWxlIElOX1NQX1RBU0sgaXMgY2xlYXI/DQoN
Cj4gWWVhLCBJIHRoaW5rIHRoaXMgaXMgcmVhbC4NCg0KPiBOb3Qgc3VyZSBpZiBNaWNoYWVsIG9y
IHRoZSBvdGhlciBCcm9hZGNvbSBmb2xrcyBoYXZlIGEgc3VnZ2VzdGlvbiBoZXJlPyAgDQo+IE1h
eWJlDQo+IHRoZSBtaW5pbWFsIGZpeCBpcyB0byBjbGVhciBJTl9TUF9UQVNLIGJlZm9yZSBibnh0
X3VscF9zdG9wKCkgYW5kIGNhbGwNCj4gYm54dF91bHBfc3RhcnQoKSBvbmx5IGFmdGVyIHVubG9j
ay4NCg0KPiBUaGUgUkRNQSB0ZWFyZG93biBvbiBldmVyeSBUWCB0aW1lb3V0IGFuZCByZXN0YXJ0
IHJhY2VzIGJlbG93IHdvdWxkIHN0aWxsICANCj4gbmVlZA0KPiBhbnN3ZXJzLCB0aG91Z2guDQoN
CkFyZSB0aGlzIGFuZCB5b3VyIHF1ZXN0aW9ucyBpbiB0aGUgbWFpbiB0aHJlYWQgYSByZWFzb24g
Zm9yIGEgdjc/DQo=
