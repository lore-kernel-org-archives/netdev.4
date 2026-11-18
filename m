Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985124;
	b=kVo4Qph/X92LH15Dz6ea9lgGByqUz2IJcBf+T4Wc6JqaprgVboa+p1hL9Y6HBwZEVzfn
	 w2CEns7yN8i8kcE0SpEoLC4Apj9ZEydoxtbDVjOvykkrFuQeb9AAda4dtYv8xWEijIy+G
	 iURrOwwr2YW4LdVagzLCUMNq/pAvs7ESbQGdtkR6sVyo4j9ttdgd2VfP9jweRE0aj32uB
	 91oEtSOtuPV3Pehp6wMKGZM+d/qXfir5N4BQu+hYmmOrOnPHO2Znd3cPjJcZmZOOH0beU
	 9JpfB+sUz494WPZtZ01hVOsie5QvJ3CcK0xwpGs+i8d5k/XtVGIHXbFrR+JDOHa61sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985124;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=FwQzXqOlZf12zJP3Pg0931RBaDdFGOMlSkw3C6GM42c=;
	b=QT2VaG90Se6Cwgamv9QLyl9bysLXj7Kik51jeMjh0HMKINMYEhAkREQ/vvBBzocDBt98
	 CcFz0MiRPl1jaSDlXafbAA2jVa19EBYgJXae08cChluaYIslCNbrEdDfWK2OkXON4ivrX
	 +eTRy2lieJJAk9rkvOVTgND2LC91YGl36RvLoutB8vYnDiM7hHnmI4cXFi+cQVqBcnQqQ
	 uG69b4SMfNY4zX3cfTIOkJAWWBTFk1CjfxJ933PW2FKKnSwiAsKSd76uHBiuJnzCvCK84
	 Yckh/4QyybljSDJJm4JHhf7lyyj69P26PyXv4LdpWAaC/0FDKdNeUJ+fY9yvo5/oiPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IZK5hxXj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C9606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IZK5hxXj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI6w9Q211123916, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794985089; bh=FwQzXqOlZf12zJP3Pg0931RBaDdFGOMlSkw3C6GM42c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=IZK5hxXjMkHUsEtH/dDvVO0voAre2tvof2+KrWjgIp8Mf2JOrTm5dgRGjcgQOOUdu
	 yWpJd/0JkrxkwZHfB72BcMYRzGGULEycz3ixexZSH9XEPpd/9LJ6wlxwx/2ENrWQ22
	 AYhkqG3za7TDWtBNl2kbOvzHp/4DMcwAp7LUdgYedRCuruWs9gSddJ7jd8gi7Om4Ov
	 fGIyBdcLaXPJiPONrk4tlmRPxDa756yPNkP2jeiBfwf8bqHByZUpdlEAtSv3mRkODd
	 DNorvyGk9e9EkmHssD+8hVEpsfZ5to3G3fdp70LuanGWXjOSHapFoXawXzmEYjGL30
	 7o6PkN4mAEWTg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI6w9Q211123916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 14:58:09 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:58:09 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 14:58:09 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: "oraveeps@pm.me" <oraveeps@pm.me>, Chih Kai Hsu <hsu.chih.kai@realtek.com>
CC: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>,
	"mail@birger-koblitz.de" <mail@birger-koblitz.de>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
Thread-Topic: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
Thread-Index: AQHdb2VfgJsm8wxO00aZW8BLDoptIbcwahig//+eEICAA2yhAA==
Date: Wed, 18 Nov 2026 06:58:09 +0000
Message-ID: <260ddf2d9e344d2dae559a1c3909e92f@realtek.com>
References: <PfNGg6VjMdDzTCX2LETCm65NKSR0af1EG7ZX5CI-7Fef0x8NE2MnZ8fNtgr1Hm86sNjqHXcNyyqIbbeZL5jDu7URTqMygnyj4ulG00NxR7U=@pm.me>
 <7b6ef8fb2c14485380c90f1f7521ea9b@realtek.com>
 <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me>
In-Reply-To: <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

b3JhdmVlcHNAcG0ubWUgPG9yYXZlZXBzQHBtLm1lPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDE2LCAyMDI2IDY6MzggUE0NClsuLi5dDQo+IEhpIEhheWVzLA0KPiANCj4gVGhhbmtzIGZvciB0
aGUgZmlsZXMgKHJ0bDgxNTctMSBhbmQgcnRsODE1OS0xLCB2MSAxMS8xMy8yNikuIE1haW5saW5l
DQo+IHI4MTUyICh2Ny4yLjQgaGVyZSwgc2FtZSBjb2RlIGluIHY3LjQtcmMxKSByZWplY3RzIHRo
ZW0gYXQgdGhlIGZpcnN0DQo+IGJsb2NrOiBydGw4MTUyX2lzX2Z3X21hY19vaygpIGhhcyBubyBS
VExfVkVSXzE2L1JUTF9WRVJfMTcgY2FzZSBmb3INCj4gUlRMX0ZXX1BMQSBvciBSVExfRldfVVNC
LCBzbyBydGw4MTUyX2NoZWNrX2Zpcm13YXJlKCkgZmFpbHMgd2l0aA0KPiAiY2hlY2sgVVNCIGZp
cm13YXJlIGZhaWxlZCIuDQo+IA0KPiBBbiBydGw4MTU5LTEuZncgd2l0aCBvbmx5IHlvdXIgUEhZ
X1NQRUVEX1VQIGJsb2NrIChjaGVja3N1bQ0KPiByZWNvbXB1dGVkKSBsb2FkcyB3aXRoIHRoZSBp
bi10cmVlIGRyaXZlciBvbiA3LjIuNCBhbmQgbGlua3MgbXkgUlRMODE1OQ0KPiBhZGFwdGVyICgw
YmRhOjgxNWEpIGF0IDEwRy4NCj4gDQo+IFRoZSBzZXJpZXMgInI4MTUyOiBzcGxpdCBSVExfVkVS
XzE3IGludG8gUUZONjggYW5kIFFGTjEwMCBwYWNrYWdlDQo+IHZhcmlhbnRzIiAodjgpIGRvZXMg
bm90IGNoYW5nZSBydGw4MTUyX2lzX2Z3X21hY19vaygpIGVpdGhlciwgc28gdGhlDQo+IGZ1bGwg
ZmlsZXMgYXJlIHJlamVjdGVkIHdpdGggaXQgYXBwbGllZCB0b28uIElzIGEgZHJpdmVyIGNoYW5n
ZSBmb3IgdGhlDQo+IFBMQS9VU0IgYmxvY2tzIHBsYW5uZWQ/IElmIG5vdCwgY291bGQgcnRsODE1
OS0xLmZ3IGNhcnJ5IG9ubHkgdGhlIFBIWQ0KPiBibG9jaz8NCg0KQ2hpaC1LYWkgd2lsbCB1cGRh
dGUgdGhlIGRyaXZlci4NCkhvd2V2ZXIsIHNvbWUgcGF0Y2hlcyBhcmUgc3RpbGwgcGVuZGluZyBy
ZXZpZXcsDQpzbyB3ZSBuZWVkIHRvIHdhaXQgdW50aWwgdGhleSBhcmUgbWVyZ2VkIGJlZm9yZSBw
cm9jZWVkaW5nLg0KDQoNCkJlc3QgUmVnYXJkcywNCkhheWVzDQoNCj4gVGhhbmtzLA0KPiBKb25h
cyBBdXR6ZW4NCj4gDQo+IA0KPiBPbiBNb25kYXksIDE2IE5vdmVtYmVyIDIwMjYgYXQgMDk6MzAs
IEhheWVzIFdhbmcNCj4gPGhheWVzd2FuZ0ByZWFsdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEhp
LA0KPiA+DQo+ID4gQ291bGQgeW91IHBsZWFzZSB0cnkgb3V0IHRoZSBhdHRhY2hlZCBmaWxlcz8N
Cj4gPg0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPg0KPiA+IEhheWVzDQo+ID4NCj4gPiA+IEZyb206
IG9yYXZlZXBzQHBtLm1lIDxvcmF2ZWVwc0BwbS5tZT4NCj4gPiA+IFNlbnQ6IFN1bmRheSwgTm92
ZW1iZXIgOCwgMjAyNiA1OjQyIFBNDQo+ID4gPiBUbzogSGF5ZXMgV2FuZyA8aGF5ZXN3YW5nQHJl
YWx0ZWsuY29tPg0KPiA+ID4gQ2M6IGphdmVuX3h1QHJlYWxzaWwuY29tLmNuOyBtYWlsQGJpcmdl
ci1rb2JsaXR6LmRlOw0KPiBsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnOyBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0OiBydGxfbmljOiByZXF1ZXN0IGZvciBydGw4MTU5LTEu
ZncgKFJUTDgxNTkgUEhZIGZpcm13YXJlKQ0KPiA+ID4NCj4gPiA+IEV4dGVybmFsIG1haWwgOiBU
aGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIHRoZSBvcmdhbml6YXRpb24uIERvIG5v
dA0KPiByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA+
ID4NCj4gPiA+IEhpIEhheWVzLA0KPiA+ID4NCj4gPiA+IFNpbmNlIGNvbW1pdCBhNTFlMTcxZTE3
NmMgKCJyODE1MjogQWRkIGZpcm13YXJlIHVwbG9hZCBjYXBhYmlsaXR5IGZvcg0KPiA+ID4NCj4g
PiA+IFJUTDgxNTcvUlRMODE1OSIpLCBtYWlubGluZSByODE1MiByZXF1ZXN0cyBydGxfbmljL3J0
bDgxNTktMS5mdyBmb3IgdGhlDQo+ID4gPg0KPiA+ID4gUlRMODE1OSBQSFkuIFdpdGhvdXQgaXQg
dGhlIGxpbmsgc3RheXMgYXQgNSBHYml0L3MsIGFuZCBsaW51eC1maXJtd2FyZQ0KPiA+ID4NCj4g
PiA+IGhhcyBubyBydGw4MTU5LTEuZncgeWV0IChub3IgcnRsODE1Ny0xLmZ3KS4NCj4gPiA+DQo+
ID4gPiBJIHJ1biB0aHJlZSBSVEw4MTU5IGFkYXB0ZXJzIChVU0IgSUQgMGJkYTo4MTVhKSBvbiBr
ZXJuZWwgNy4yLjQuIFRoZXkNCj4gPiA+DQo+ID4gPiByZWFjaCAxMCBHYml0L3Mgb25seSB3aXRo
IFJlYWx0ZWsncyBvdXQtb2YtdHJlZSByODE1MiB2Mi4yMi4xLCB3aGljaA0KPiA+ID4NCj4gPiA+
IGNhcnJpZXMgdGhlIFBIWSBwYXRjaCBpbnNpZGUgdGhlIGRyaXZlci4gV2l0aCBydGw4MTU5LTEu
ZncgaW4NCj4gPiA+DQo+ID4gPiBsaW51eC1maXJtd2FyZSwgdGhlIGluLXRyZWUgZHJpdmVyIGNv
dWxkIGRvIHRoZSBzYW1lIGFuZCB1c2VycyBjb3VsZA0KPiA+ID4NCj4gPiA+IGRyb3AgdGhlIG91
dC1vZi10cmVlIG1vZHVsZS4NCj4gPiA+DQo+ID4gPiBDb3VsZCBSZWFsdGVrIHN1Ym1pdCBydGw4
MTU5LTEuZncsIGFuZCBydGw4MTU3LTEuZncgaWYgdGhlcmUgaXMgb25lLCB0bw0KPiA+ID4NCj4g
PiA+IGxpbnV4LWZpcm13YXJlPyBJIGFtIGhhcHB5IHRvIHRlc3QgYSBjYW5kaWRhdGUgZmlsZSBv
biB0aGVzZSBhZGFwdGVycy4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPg0KPiA+ID4gSm9u
YXMgQXV0emVuDQo=
