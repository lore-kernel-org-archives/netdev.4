Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818846;
	b=D8iKsb3pDn/1R3B58pzPeLzAg4Y19BUjFSS07Qqt4HsBBWovg9UdiGWs+WM0fyilIxvG
	 1HCy5U5Jb5fBz0t4ogD61rePs0deYtxI/hvNvlhYgKGCU+9c2DJhHeZFAz9i8wC7F+sfg
	 uiPmESaLIsv0C7ww4rakcH+1xVmFq0+4WXxuN4djAoL90d47Vm+ekxgKid1LASYpiQT8q
	 K1L1Lag5N8AdHKKQnyWXP4p6GUHyJapfFZZvQ/YfYbH8GRHmywHj+Rpo7XOlMTlAuB/4K
	 F+0DuuQ8NLpEAmqp8eGLXfCLjm9Vn6ZfpnASLMfj19nSTOI44opBaFRcpAKWudi/QSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818846;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=CpxPwjwc+ZYwJ/LLzCiMIrB17AE2heuOVpqJXUeodI4=;
	b=qiedmca7Xh2gqMcFTdxcsFmwftNNQdEX/7bEvOlSYlI0x1KoEQlY3QIdMD6JFgNUubIe
	 myYObFdeuEmK6e94xh3N79i3aEH0ahEcurS+EeiaLDw5/TmAIUa2Q8qYRDTHeWUe7rhza
	 qh3Ns8onC/Pa7ZelD3kCGudZz4TBqZumsh4R5VsvpE0xmJ7lb2voNPTFvYKULnrBzmRqX
	 bdiALO2ffdMqKpJiY1v/zbNbDQvYxBQTrzmEHzAH+RrF0oCewQg4pjyZ/fbu/9SxEShYl
	 WIZydd4O63pIY3VIXkXyCWrCsA7ruFi7Tb/eSw5CohXVUDP5H3nB5cyGFNNasXlsCsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TWey1bbx;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1955606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1955606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TWey1bbx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794818839; bh=CpxPwjwc+ZYwJ/LLzCiMIrB17AE2heuOVpqJXUeodI4=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=TWey1bbxptYsAaA0EZLEnTwjIBxlLh3Gh8uPmZKnshofewKRoYNV0LS6aChRJvC3b
	 9cmCjU/AT4Fb0fcGqpZdMJzbljM8uhj9jw4hIH4LdD0a5KfWRx9dZo5evSR2PzoSG+
	 yeXdLiaAo32AIMt7ya7eF1q+6hv3Ojot7lmHFYmg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: MOlL/R5ZerVSsEILqNUQZvi905V4kz6vdNEMMv4LhLrR/Cm4NYPbmgljNldmcC
	 Oyh7P0HeRQvjyE27KO9DYiUjUAzsD11Q115RnJLJnOR+fNuqMeDJ+FRn1aMZjX1x3ZktrvASlJHLG
	 iON4r1macmMCK5h62McjsDDRHjSmopwPTPypik3ECCntbE3qPlVptwEnGx23XTPTYm73JoXRtmZ6G
	 E4vi9RnuwUdI9M39DAP/KRac/YVWPsDqidzWhQUzfC/cMs8YlhALh3Da/JqssVVP1IsOz5MnkvzKh
	 XSHU8t6vSq3jA+6F1EoZAfLGYnd37rhvvmIlHzoo/xfDLcrNYhTH5iRu3ghCuatnfnNwc6+5qhSvA
	 gImX9z2Y1lzoRAyvYcegHPFgHYhVqh1bcjnxqSpR/B9xhkAxFiJOgZAVt2gITV5gsi4c214O6CeA+
	 nn43qs2No947Yb+pZYWSU/kL3HC3y7mHw5Db2nDaIRNaCBkB9jECeact6DIPO0kXJoQTJlCCoh4XP
	 0R0lhFRjXyKMnA7csfrkULzgl7kAvb5Fz472M7JKLrkdCncp9mPWCB/tE9D7jQAJNkG3RKXmnAcdL
	 FUaQ4S2EPF7Ga9MzSoM+u53x+Hc+uSdckpnkGMyngLdxbYym14jsKqydfjYWMGRx2V4TXO8CrqV1N
	 V57joEdo7m2sYdlmSFObEU+pQGz8TtP7VFCNt5/7FiLgRujLMJekqjLwzRqmzt9tbphlwwExvNkvm
	 uN72DVmwIkk4p3aG896sBzJ9RBhxjE9GLsonJO4//IgxGig723+FtW+5NyuAcrWLGpmxklUiAWFdk
	 7JTeDq5fZlAlHh1sAW/S5uU17c3cz/mU95uPwCNJcIGRfKt5VxLl8C07ZmcCd0f5RSkEMqF+guPf8
	 4cNfb0C/h4VddRGv1LBR+lpRvnlBfyX3rTzKx4EpNsZZyjZLt0nJJb/d0S8isvNDp/lqtqULJW+VM
	 VVzpxDk3K7wqZde04guvyc5AwVeKqMk1ONyeiE0TXMUZ2Fs5HxA/y9lQPDeWMg2jEYxLPvZ/WrvQ3
	 51Gv/z6JTGgUiyQoIK+Of+v8AeYMNgg7+jaZlRN61B/5v0/08IlJq5Nu/TlzPSMVs8BUIKP2NaWQo
	 uIvkNW0MpSCoPQ==
From: "=?utf-8?B?Q29uZ2ppZSBaaG91?=" <zcjie0802@qq.com>
To: "=?utf-8?B?TWljaGFlbCBTLiBUc2lya2lu?=" <mst@redhat.com>
Cc: "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?amFzb3dhbmdpbw==?=" <jasowangio@gmail.com>, "=?utf-8?B?ZXBlcmV6bWE=?=" <eperezma@redhat.com>, "=?utf-8?B?eHVhbnpodW8=?=" <xuanzhuo@linux.alibaba.com>, "=?utf-8?B?YW5kcmV3K25ldGRldg==?=" <andrew+netdev@lunn.ch>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?ZWR1bWF6ZXQ=?=" <edumazet@kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>, "=?utf-8?B?cGFiZW5p?=" <pabeni@redhat.com>, "=?utf-8?B?aG9ybXM=?=" <horms@kernel.org>, "=?utf-8?B?dmlydHVhbGl6YXRpb24=?=" <virtualization@lists.linux.dev>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after NAPI ownership release
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 16 Nov 2026 16:47:17 +0800
X-Priority: 3
Message-ID: <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
	<20261115175445-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261115175445-mutt-send-email-mst@kernel.org>
X-QQ-mid: xmsezc52-0t1794818837tna47ww5b

VHJpZWQgeW91ciBwYXRjaCB3aXRoIG15IGVhcmxpZXIgVENQIHRlc3QuIE5vIG1vcmUgY29t
cGxldGUgTkFQSQpzdGFsbHMgc28gZmFyLCB0aGFua3MhCgpCdXQgTExNIGZvdW5kIGFub3Ro
ZXIgcG9zc2libGUgaW50ZXJsZWF2aW5nLCB0aG91Z2guIEkgcmVwcm9kdWNlZCBpdAppbiBh
biBpbnN0cnVtZW50ZWQgS1VuaXQgdGVzdCB3aXRoIGluamVjdGVkIGRlbGF5cywgYnV0IGhh
dmVuJ3QgaGl0Cml0IGluIHRoZSBUQ1AgdGVzdC4KCldpdGggZGVmZXJfaGFyZF9pcnFzPTEs
IGl0IGdvZXMgbGlrZSB0aGlzOgoKQ1BVMSAvIG9sZCBwb2xsICAgICAgICAgICAgICAgICAg
Q1BVMiAvIGJ1c3ktcG9sbAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDb21wbGV0ZTogY2xlYXIgU0NIRUQsCmFybSB0
aW1lciwgcmV0dXJuIGZhbHNlLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
YWtlIE5BUEkgb3duZXJzaGlwLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBF
bnRlciBidXN5X3BvbGxfc3RvcCgpLCBjbGVhcgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBJTl9CVVNZX1BPTEwuIFRoZSBmaW5hbCBwb2xsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVuYWJsZXMgY2FsbGJhY2tzLCB0aGVuIHBhdXNlcwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBiZWZvcmUgY29tcGxldGlvbi4KV2F0Y2hkb2cg
ZXhwaXJlcywgc2VlcwpTQ0hFRD0xLCBleGl0cyB3aXRob3V0CnNjaGVkdWxpbmcgb3Igc2V0
dGluZyBNSVNTRUQuCkRpc2FibGUgY2FsbGJhY2tzLgpUaW1lcj0wLCBTQ0hFRD0xLCBzbyBz
a2lwCm5hcGlfc2NoZWR1bGUoKSBhbmQgZXhpdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbmFwaV9jb21wbGV0ZV9kb25lKC4uLiwgMCk6CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRlZmVyIGNvdW50PTAsIG5vIE1JU1NFRC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQ2xlYXIgU0NIRUQsIHJldHVybiB0cnVlLgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBRdWV1ZSBpcyBlbXB0eSwgZXhpdC4KClRoZW4g
dGhlIGRldmljZSBhZGRzIGEgdXNlZCBlbnRyeSwgYnV0IGNhbGxiYWNrcyBhcmUgc3RpbGwg
ZGlzYWJsZWQsCndpdGggbm8gdGltZXIgb3IgcG9sbCBwZW5kaW5nLgoKU28gU0NIRUQ9MSBh
dCB0aGUgY2hlY2ssIGJ1dCB0aGF0IHBvbGwgaGFzIGFscmVhZHkgZW5hYmxlZCBjYWxsYmFj
a3MKYW5kIHdvbid0IGVuYWJsZSB0aGVtIGFnYWluIGFmdGVyIHRoZSBvbGQgcG9sbCBtYXNr
cyB0aGVtLgoK

