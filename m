Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656342;
	b=v7qZHYhyXbh80titP25m2Q2Lq+sRqfRWuPaCaerp0kfFRgrCrCRooAHhgTn35199PYfz
	 aUMkLYjq4loouimsLrYLS9fPo1K6Sknwlt0P+9rUPP67v8s8JxIYMcu78yzQYOAruQmBR
	 2vkkP//yxaUiZg/YWsU02AUcAsdGg98CMz2s7Pt/q3AJwhORZbhb5kgLPm5N1HAka9jAn
	 frAB+g0UtcKWZJCEgFiN+/tyxjOZ/g0ypvYQOrQpF92md2fRDh14ABCOwEKF20ebKXK1y
	 qqHdpgJ7L5ln3waRJ7jSXAbXg4pC9GFJbIYcViDqNZnRU3yv/P+geVLb5tPGCHCXEPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=zqpy/ujIKdE+RaX5YsmhBcXwpTFeGTsTy4qeAJjN6aA=;
	b=i1XSXoqVxDZAQH25tuAZBhbUbEkAIRZuQjZ+7E47YrF/RmmpH6nsTWx9nEI0gflQav47
	 xTfJWd9abm0LnF9Ri4bBnbfmG4pWPy/199lKbN4dh4jVaJjsEJ6WRqhvHWgp/tVR7wqeM
	 KwO3P1e2PpfAeetcaoh4CehC+dxuCqpY1fa7mB5XYU+mEXQs2Khcjyt+h9smCWrSmzVCn
	 BCNgiipUeLqNcTDjN0R3yY/eRaFqAVKI55Q1spdZnpj+U3EFvIYyM9IRVOTkvIa9xzYhW
	 76L5fcynWZDJJz0k9K0hUSbSW4sTjHiPBInZTDfRIiQHfRet9S9ue9nM5Tu1KY6plHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bS87q7Nl;
	arc=none smtp.remote-ip=209.85.160.200
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402C606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B402C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bS87q7Nl
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55bb7f70b06so113737381cf.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795656341; x=1796261141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zqpy/ujIKdE+RaX5YsmhBcXwpTFeGTsTy4qeAJjN6aA=;
        b=bS87q7NlioVjMDi1zqjELaj84CMXptojrbD9tyZB/JB5UYzWRF5ot7CQgqe+xEXhog
         LchjVg0YeuE4iAXcDojAC04xSj6NjIRPfk0fvK99TBkqkydbVP0dWuys/aBd+QgMFrSD
         ijrC947W3mm/zh6WzWJOs1TfyJGrFq281A8IbTDl48GdE5s/pzqypvdUl/5Lp4q83KDT
         GSahY9K+JdyWwLWW6Qyt+j9py0OqYtJo0OVK1cB0h8Ue2wYgV+FfDL6lcj8NH7S3I5oZ
         F/i5Wn2+ccksRYQF4PdcMq92zBq8A8Og+R3cVeaG4kErzeDHoQLEKvuzCBU/Xw104cH+
         EsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656341; x=1796261141;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqpy/ujIKdE+RaX5YsmhBcXwpTFeGTsTy4qeAJjN6aA=;
        b=2BFTZRuZtWA7QJX3ScGBZLtlFRJBp/OR/8d/kNlAz7RpsPjtYaPwu+4SkL21eYjJC2
         NUSb39z8YhuQYRtMwvQJBf/KI58GvjQHpOlNIR4q6Y0ak6TtCnjOSBEd5zxjZ8weNkub
         xAPFe7ToX877MBYspwaHNToe9XDhOb4XHy3LRCpgBH6X6hZ5Z9X3P7v2+Gg/JKeb2PpN
         nT4LHk0aQcfwEyj3n5cWqh4msmyBgOg6jY6Y7R8VLu9/JdjiFJMz0okhB6c/IBRfX125
         8Z+nwiiXTBfh9Z9j8foSXoZ0WubQt+rZYPNg3RhVsZb/n4JL4LJ/QlClq63g5Xet9NmB
         OoMA==
X-Gm-Message-State: APuU4Z/9Mm0Xr6ra+HG9rVnt5ex8pAWTPsRVnPl2qQAUds+3RcY6bPq7
	osAsrqGBrma//zJL+qvPuiCjL8r27hhhlfrLpU6uQa8SnN6xGeCrZZD9n9FaA8QYqtc3YRAigOP
	gQ4jfjmwCUA==
X-Received: from qtpp16-n2.prod.google.com ([2002:a05:622a:9d0:20b0:536:18bc:b19c])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:622a:248a:b0:536:48e4:680f
 with SMTP id d75a77b69052e-55d76a5b31emr326840661cf.30.1795656340388; Wed, 25
 Nov 2026 17:25:40 -0800 (PST)
Date: Wed, 25 Nov 2026 20:25:39 -0500
In-Reply-To: <179532244301.3135.14806986987888080886@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118042614.878448-1-vmukunda@marvell.com> <179532244301.3135.14806986987888080886@kernel.org>
Message-ID: <willemb.25fe67ed9e671@google.com>
Subject: Re: [PATCH net v2] octeontx2-af: widen TX scheduler queue index to 11 bits
From: willemb@google.com
To: netdev-bot+sashiko@kernel.org, vmukunda@marvell.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, sgoutham@marvell.com, 
	rkannoth@marvell.com, gakula@marvell.com, sbhatta@marvell.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, skoteshwar@marvell.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

bmV0ZGV2LWJvdCtzYXNoaWtvQCB3cm90ZToNCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1
dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUocykgdG8g
Y29uc2lkZXIuDQoNCj4gQ3JpdGljYWw6IDAgwrcgSGlnaDogMSDCtyBNZWRpdW06IDAgwrcgTG93
OiAwDQoNCj4gSWYgeW91IGJlbGlldmUgbm9uZSBvZiB0aGUgaXNzdWVzIGFyZSBsZWdpdGltYXRl
LCBwbGVhc2UgcmVwbHkgdG8gZWFjaA0KPiBpc3N1ZSBvZiBNZWRpdW0gc2V2ZXJpdHkgb3IgaGln
aGVyIGFuZCBleHBsYWluIHdoeSB0aGUgQUkgaXMgd3JvbmcuDQo+IElmIGFueSBvZiB0aGVtIGFy
ZSBsZWdpdGltYXRlIGFuZCB5b3UgcGxhbiB0byByZXNwaW4sIHBsZWFzZSBsZXQgcGF0Y2h3b3Jr
DQo+IGtub3cgYnkgaW5jbHVkaW5nICJwdy1ib3Q6IGNyIiBhcyBhIHNlcGFyYXRlIGxpbmUgYXQg
dGhlIGVuZCBvZiB5b3VyIHJlcGx5DQo+IChvbmUgc3VjaCByZXBseSBwZXIgc2VyaWVzIGlzIGVu
b3VnaCkuDQoNCj4gLSBbSGlnaF0gVGhpcyBwYXRjaCBmaXhlcyAxMS1iaXQgU01RIGluZGljZXMg
b25seSBvbiB0aGUgTklYX1RYU0NIUV9DRkcNCj4gICAgcmVnaXN0ZXIgcGF0aCwgYnkgd2lkZW5p
bmcgVFhTQ0hRX0lEWF9NQVNLIGFuZCBOSVhfVFhfU0NIUV9NQVNLLg0KDQo+IC0tDQoNCj4gb2N0
ZW9udHgyLWFmOiB3aWRlbiBUWCBzY2hlZHVsZXIgcXVldWUgaW5kZXggdG8gMTEgYml0cw0KDQo+
IFRoaXMgY29tbWl0IHdpZGVucyBUWFNDSFFfSURYX01BU0sgZnJvbSAxMCB0byAxMSBiaXRzIGFu
ZCBleHRlbmRzDQo+IE5JWF9UWF9TQ0hRX01BU0sgdGhyb3VnaCBiaXQgMjYuIFdpdGggdGhhdCwg
c2NoZWR1bGVyIHF1ZXVlIGluZGljZXMgb2YNCj4gMTAyNCBhbmQgYWJvdmUgYXJlIG5vIGxvbmdl
ciB0cnVuY2F0ZWQgb24gdGhlIE5JWF9UWFNDSFFfQ0ZHIHJlZ2lzdGVyDQo+IHBhdGguIFRoZSB0
YXJnZXQgaXMgQ04yMEssIHdoZXJlIHRoZSBTTVEgZmllbGQgb2YgdGhlIFNRIGNvbnRleHQgaXMg
MTENCj4gYml0cyB3aWRlLg0KDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L21hcnZlbGwvb2N0ZW9udHgyL2FmL21ib3guaCAgDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
bWFydmVsbC9vY3Rlb250eDIvYWYvbWJveC5oDQo+ID4gaW5kZXggY2VjZTE5N2QxMDc0Yi4uMWI2
MmY5ZDdmMDBhMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxs
L29jdGVvbnR4Mi9hZi9tYm94LmgNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2
ZWxsL29jdGVvbnR4Mi9hZi9tYm94LmgNCj4gPiBAQCAtMTE2NCw3ICsxMTY0LDcgQEAgc3RydWN0
IG5peF90eHNjaHFfY29uZmlnIHsNCj4gPiAgCXU4IGx2bDsJLyogU01RL01EUS9UTDQvVEwzL1RM
Mi9UTDEgKi8NCj4gPiAgCXU4IHJlYWQ7DQo+ID4gICNkZWZpbmUgVFhTQ0hRX0lEWF9TSElGVAkx
Ng0KPiA+IC0jZGVmaW5lIFRYU0NIUV9JRFhfTUFTSwkJKEJJVF9VTEwoMTApIC0gMSkNCj4gPiAr
I2RlZmluZSBUWFNDSFFfSURYX01BU0sJCShCSVRfVUxMKDExKSAtIDEpDQoNCj4gW1NldmVyaXR5
OiBIaWdoXQ0KPiBUaGlzIGZpeGVzIHRoZSB0eHNjaHEgcmVnaXN0ZXIgcGF0aC4gSXMgdGhlcmUg
c3RpbGwgYW5vdGhlciBwbGFjZSBvbg0KPiBDTjIwSyB3aGVyZSBhbiBTTVEgaW5kZXggb2YgMTAy
NCBvciBhYm92ZSBpcyBjdXQgZG93biB0byAxMCBiaXRzPw0KDQo+IG90eDJfc2V0dXBfZGV2X2h3
X3NldHRpbmdzKCkgc2V0cyBDTjEwS19MTVRTVCBvbiBldmVyeSAhaXNfZGV2X290eDIoKQ0KPiBk
ZXZpY2UsIGFuZCB0aGF0IGluY2x1ZGVzIENOMjBLLiBBcyBhIHJlc3VsdCwNCj4gb3R4Ml9wZmNf
dXBkYXRlX3NxX3NtcV9tYXBwaW5nKCkgaW4gbmljL290eDJfZGNibmwuYyB0YWtlcyB0aGUgY24x
MGsNCj4gcmVxdWVzdCBicmFuY2g6DQoNCj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9v
Y3Rlb250eDIvbmljL290eDJfZGNibmwuYzpvdHgyX3BmY191cGRhdGVfc3Ffc21xX21hcHBpbmco
KSAgDQo+IHsNCj4gICAgICAuLi4NCj4gCWlmICh0ZXN0X2JpdChDTjEwS19MTVRTVCwgJnBmdmYt
Pmh3LmNhcF9mbGFnKSkgew0KPiAJCWNuMTBrX3NxX2FxID0gb3R4Ml9tYm94X2FsbG9jX21zZ19u
aXhfY24xMGtfYXFfZW5xKCZwZnZmLT5tYm94KTsNCj4gICAgICAuLi4NCj4gCQljbjEwa19zcV9h
cS0+c3FfbWFzay5zbXEgPSBHRU5NQVNLKDksIDApOw0KPiAJCWNuMTBrX3NxX2FxLT5zcS5zbXEg
PSBvdHgyX2dldF9zbXFfaWR4KHBmdmYsIHByaW8pOw0KPiAgICAgIC4uLg0KPiB9DQoNCj4gbml4
X2NuMTBrX3NxX2N0eF9zLnNtcSBpcyBhIDEwLWJpdCBmaWVsZCwgc28gYml0IDEwIG9mIHRoZSBT
TVEgaW5kZXggaXMNCj4gZHJvcHBlZC4gVGhlIG1hc2sgYWxzbyBjb3ZlcnMgb25seSBiaXRzIDk6
MC4NCg0KPiBPbiB0aGUgQUYgc2lkZSwgd2hlbiBpc19jbjIwaygpIGlzIHRydWUsIG5peF9nZXRf
YXFfcmVxX3NtcSgpIHJlYWRzDQo+IGV2ZXJ5IHJlcXVlc3Qgd2l0aCB0aGUgMTEtYml0IGNuMjBr
IGxheW91dDoNCg0KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL29jdGVvbnR4Mi9hZi9y
dnVfbml4LmM6bml4X2dldF9hcV9yZXFfc21xKCkgew0KPiAJaWYgKGlzX2NuMjBrKHJ2dS0+cGRl
dikpIHsNCj4gCQkqc21xID0gKChzdHJ1Y3Qgbml4X2NuMjBrX2FxX2VucV9yZXEgKilyZXEpLT5z
cS5zbXE7DQo+IAkJKnNtcV9tYXNrID0gKChzdHJ1Y3Qgbml4X2NuMjBrX2FxX2VucV9yZXEgKily
ZXEpLT5zcV9tYXNrLnNtcTsNCj4gCQlyZXR1cm47DQo+IAl9DQo+ICAgICAgLi4uDQo+IH0NCg0K
PiBJbiB0aGUgY24yMGsgbGF5b3V0LCBiaXQgMTAgc2l0cyB3aGVyZSB0aGUgY24xMGsgbGF5b3V0
IGhhcyBjcV9lbmEsIGFuZA0KPiB0aGF0IGJpdCBpcyAwIGluIGJvdGggdGhlIHZhbHVlIGFuZCB0
aGUgbWFzay4gU28NCj4gcnZ1X25peF9ibGtfYXFfZW5xX2luc3QoKSBjYWxscyBpc192YWxpZF90
eHNjaHEoKSB3aXRoIChzbXEgJiAweDNmZikuDQo+IFRoZSBtYXNrZWQgQVEgd3JpdGUgdGhlbiBs
ZWF2ZXMgYml0IDEwIG9mIHRoZSBleGlzdGluZyBoYXJkd2FyZSBTUQ0KPiBjb250ZXh0IHVuY2hh
bmdlZC4NCg0KPiBEZXBlbmRpbmcgb24gdGhlIG9sZCBhbmQgbmV3IFNNUSwgd291bGQgdGhpcyBn
aXZlIHRoZSBmb2xsb3dpbmc/DQoNCj4gICAgb2xkIDwgMTAyNCwgbmV3ID49IDEwMjQ6IHRoZSBT
USBpcyBwcm9ncmFtbWVkIHRvIG5ldyAmIDB4M2ZmLCB3aGljaCBpcw0KPiAgICB0aGUgd3Jvbmcg
U01RLCBvciB0aGUgb3duZXJzaGlwIGNoZWNrIHJlamVjdHMgdGhlIHJlcXVlc3QuDQoNCj4gICAg
b2xkID49IDEwMjQsIG5ldyA+PSAxMDI0OiB0aGUgb3duZXJzaGlwIGNoZWNrIHJ1bnMgb24gYW4g
U01RIHRoZQ0KPiAgICBmdW5jdGlvbiBwcm9iYWJseSBkb2Vzbid0IG93biwgc28gUEZDIGNvbmZp
Z3VyYXRpb24gZmFpbHMuDQoNCj4gICAgb2xkID49IDEwMjQsIG5ldyA8IDEwMjQ6IHRoZSBBRiBh
cHByb3ZlcyBTTVEgWCwgYnV0IHRoZSBoYXJkd2FyZSBpcw0KPiAgICBzZXQgdG8gWCB8IDB4NDAw
LCB3aGljaCBtYXkgYmVsb25nIHRvIGFub3RoZXIgUEYgb3IgVkYuDQoNCj4gVGhlIENOMjBLIFNR
IGluaXQgcGF0aCBpbiBjbjIway5jIHVzZXMgbml4X2NuMjBrX2FxX2VucV9yZXEgYW5kDQo+IHBy
b2dyYW1zIGFsbCAxMSBiaXRzLiBUaGUgUEZDIHBhdGggZG9lcyBub3QsIGFuZCBpdCBpcyByZWFj
aGFibGUgdGhyb3VnaA0KPiBkY2JubCBpZWVlX3NldHBmYyAtPiBvdHgyX3BmY190eHNjaHFfdXBk
YXRlKCkgLT4NCj4gb3R4Ml9wZmNfdXBkYXRlX3NxX3NtcV9tYXBwaW5nKCkuDQoNCj4gVGhlIEZp
eGVzOiB0YWcgcG9pbnRzIGF0IGI1ZGNkZGUwNzRkNSwgd2hpY2ggYWxzbyBhZGRlZCB0aGUgY24y
MGsNCj4gZGVjb2RpbmcgaW4gbml4X2dldF9hcV9yZXFfc21xKCkuIFNob3VsZCB0aGUgUEZDIHJl
bWFwIGJlIHVwZGF0ZWQgYXMNCj4gcGFydCBvZiB0aGlzIGZpeCB0b28/DQoNClBUQUwgYXQgdGhp
cyBmaW5kaW5nLCBsb29rcyBsZWdpdA0KDQotLQ0KDQpwdy1ib3Q6IGNyDQoNCg==
