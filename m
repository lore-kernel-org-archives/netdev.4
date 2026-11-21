Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244365;
	b=VNYYpF4NPwpKwHi1xEyXEx7/mYtfsStFcKAG4HMmBaUHqfKPx0ggQGEUdU1NXEL5vO5Q
	 r0dhWu1KhlD7O2pqYRQs8baXzkJhdDDaxiQt9J2Q6ibZ5xW/RrwW3hPQOhzNoGtRUglDh
	 EKgbcj4bvmdzx9KDNYBnw2fO7NUVbSWjI0Nj0McyuwJe9pD3ky04qq2Z/S0azCuW7if3M
	 tpgBQjhaaNYEC57hBSTYC+2edjzNasFv0auZwFrKJWDx+NF0/jXBev/ieZBTINYT7zIk8
	 3xbDHIQd9IqgFAyj5BGbkl/Qjj+E5f6o3Nafd/4SAtVcYBjfJNBsUv0RC26XnjfwTkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244365;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=hlvaZys5qxJM2YJKkik6+dsensA28nrg8rmovoEw32U=;
	b=BQbH12XdCyD9Qqwmplwx64rkv6SdwZsthnh7F8oYM4fVwLhj+usrD0WTv91KyqypgZrA
	 dmdAvgYKcsF4j+7eihks49QqEBsNbUjMcavMsYFD4kaXeqKNNaGe8qU/dVgqqWbDXy9lQ
	 tnB6bo1iVFdY0tRxBoUOh6QmmsODjVuau3c1z3YHHAioyMzrOUgfEmga7s1bUdaGYVx2o
	 6yjrtwOyS2n2NSlkirpWZ0qPVmrUeDRxrADGz6Wrsh48NYTeSNo6oWCdvXUuuNkNFmxKp
	 /0k3MRjTED7KVNwRSWVH/hxnQTT6VUc1tJyjGX9kqQK6+j5gPbQ2yAud5W9xqaFZl6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hNeVALVs;
	arc=none smtp.remote-ip=203.205.221.173
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70C4606A331
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 06:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hNeVALVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795244361; bh=hlvaZys5qxJM2YJKkik6+dsensA28nrg8rmovoEw32U=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=hNeVALVs99OH+y9qYQfgA+RIMiTeH6TUdn2K5e8eW+n6AgU1aCZTUYJRJbiauV9nR
	 XTXAid9nwX0QZnjSoWUR/83uevTw2rWGRGM4Odb2pL/X+Def/gxeBxNX+zY8JgeUVQ
	 LMyPXWRnWeUMNTar0ZKzfw9FaO/bRI3PhCGkEsKw=
X-QQ-XMRINFO: MSVp+SPm3vtS5W9KI9BQRTZiw7MqxeeqDQ==
X-QQ-XMAILINFO: MOQpAxjIVJuk3lPEj1/eTfBu0tWl0wmkcrCI2Rx98SNwSMkDq0a+pTTNjQpLa+
	 extcgcCLgNSbO30nNlVbyBKatBv7zMG+BQ5RfPwfD0IKcbJeLEqrrb1sYt6HbNLcmaM0ND0B84jK+
	 0x2RpK2OKHOJW06vkWC0e22WUkyGKGWPY8yG46D6YzYch76Eu3sBo4qqAV4lIg/0XGbsm9mJJ12p3
	 pVjnlt4Ez6EChwe4nJEWWBVMRRYk6Uv7Qry/PMzapqhBPv9sWM2PAGT+AYoBa6jO+A7hM/uN6ND0d
	 C7z/sbRvdS5InkWrhVVDbaWt3n1jN3hBq8ooPz/t35NzSpTexJW8v7t1wWZv0kfVxO6w7bNWIUZuh
	 7WSVt96s7tK7JWG5SV4uciG0doRuH5M4HEkA/6J05fCFcvBXix//GEvzU/dXCFLyUB9xsSvjkezx5
	 fuRx4t3Hdo8ZTmHxh6KhyEPFuu9LINf3dp3vosG81HBX3lFMULffAY8TK0wJ4xIwBpD4jb3NQaU1e
	 HJR/Sw/+7FZ5CccKdeBCxHdgz2HAxe9LLarq2yb8lO6MPuvOUb1q2o9k9ugNt7EvbcdGqybjVacCH
	 qiM3aarFJadkTet4ZeL11xP6IjNDD0ExGgmf55i8+Qid+siTd0mYJ+DefyNS8aKmKlf1Dkv7G5k25
	 Kn3n6citOZLqIPX7hfCvbizEo/+GiB+Rw9+wFrCZZJqSFDLoQbhD0kcsCtpiO38r2nXu1vVpJXB44
	 CKrZBd6krsry8n9xu6xORon8uBQjBeTedyEiRZREH6hmO//+7f22mvReOsDT7+4bod2k78twL52X5
	 +etzUVy7T4fFwCm1iMMBgNIzjaeXMzAG10xVEsXNjXCE/Qs5jHT23c17A3raacqkRyNmJ1M91ZPBB
	 BnUzr0lcmk65P2KHQJMwzg/mzEjxCzbIaNY8eJ9FUhwFGrtenC7D+OmaETKHQI84Hib49ZdMIq7Ip
	 KO3DR68FJS2Y4q9lqdh94bSiTL1Y7FsxPQapunTi7Xeg8+FBjMg4AK5Mc2h1yJmGb7WluhdmtzQw2
	 1Zpk/1024/5Vo6crP/62S6hV9kpmMan1xXGij
From: "=?utf-8?B?6YCQ5b2h5qKm?=" <3596417740@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzaW5mbw==?=" <netdev-bot+sinfo@kernel.org>
Cc: "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?RGF2aWQgUyAuIE1pbGxlcg==?=" <davem@davemloft.net>, "=?utf-8?B?SmFrdWIgS2ljaW5za2k=?=" <kuba@kernel.org>, "=?utf-8?B?RXJpYyBEdW1hemV0?=" <edumazet@google.com>, "=?utf-8?B?UGFvbG8gQWJlbmk=?=" <pabeni@redhat.com>
Subject: Re: [PATCH] ipv6: reject datagrams that leave no room past the fragment header
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
Date: Sat, 21 Nov 2026 14:59:19 +0800
X-Priority: 3
Message-ID: <tencent_C2B6FF364DE90BADF7C41AB25B3EE3406107@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
	<179524341514.3294.12249348939105146017@kernel.org>
In-Reply-To: <179524341514.3294.12249348939105146017@kernel.org>
X-QQ-mid: xmsezc43-0t1795244359taaqacgqg

SGksCgp0aGFua3MgZm9yIHRoZSB0cmlhZ2UuIEFuc3dlcmluZyB0aGUgcXVlc3Rpb24gZGly
ZWN0bHk6IHRoaXMgd2FzIG5vdCBoaXQKaW4gcHJvZHVjdGlvbiBhbmQgaXMgbm90IGZyb20g
c3l6Ym90LiBJdCBjYW1lIG91dCBvZiBhIG1hbnVhbCBhdWRpdCBvZgpfX2lwNl9hcHBlbmRf
ZGF0YSgpIHRoYXQgc3RhcnRlZCBmcm9tIENWRS0yMDI2LTUzMzYyICg3MzZiMzgwZSksIHdp
dGggTExNCmFzc2lzdGFuY2UgZm9yIHRoZSBpbml0aWFsIGNvZGUgcmVhZGluZzsgdGhlIGFy
aXRobWV0aWMsIHRoZSByZXByb2R1Y2VyCmFuZCB0aGUgZml4IHdlcmUgdGhlbiBkZXJpdmVk
IGFuZCB2ZXJpZmllZCBieSBoYW5kIG9uIGEgcmVhbCBrZXJuZWwuCgpDb25jcmV0ZWx5OgoK
LSBJIHdlbnQgdGhyb3VnaCB0aGUgcGFnZWQtYWxsb2NhdGlvbiBhY2NvdW50aW5nIGFnYWlu
IGFmdGVyIHRoZSBmcmFnZ2FwCiAgZml4LCBsb29raW5nIGZvciBvdGhlciB2YWx1ZXMgdGhh
dCBjYW4gbWFrZSB0aGUgbG9vcCBmYWlsIHRvIG1ha2UKICBwcm9ncmVzcy4KCi0gVGhlIGRl
Z2VuZXJhdGUgY2FzZSBpcyBtYXhmcmFnbGVuID09IGZyYWdoZWFkZXJsZW4sIGkuZS4KICBt
dHUgLSBmcmFnaGVhZGVybGVuIGluIFs4LDE1XS4gVGhlIGNsYW1wIHRoZW4gbGVhdmVzIHpl
cm8gY2FwYWNpdHksCiAgcGFnZWRsZW4gdW5kZXJmbG93cywgY29weSBjYW5jZWxzIGJhY2sg
dG8gemVybywgYW5kCiAgbGVuZ3RoIC09IGNvcHkgKyB0cmFuc2hkcmxlbiBjb25zdW1lcyBu
b3RoaW5nOyB0aGUgbG9vcCBrZWVwcwogIGFsbG9jYXRpbmcgb25lIHNrYiBwZXIgaXRlcmF0
aW9uIHVudGlsIHRoZSBzb2NrZXQgd21lbSBidWRnZXQKICAoMiAqIHNrX3NuZGJ1ZikgaXMg
ZXhoYXVzdGVkIGFuZCByZXR1cm5zIC1FTk9CVUZTLgoKLSBSZXByb2R1Y2VkIG9uIHY2LjEy
Ljk2IHdpdGggYSBzdGFuZGFsb25lIEMgcHJvZ3JhbTogSVBWNl9NVFU9MTI4MCBwbHVzCiAg
YSAxMjMyLWJ5dGUgcm91dGluZyBoZWFkZXIgKGZyYWdoZWFkZXJsZW4gPSAxMjcyKSwgdGhl
biBvbmUgc3BsaWNlKCkKICB3aXRoIFNQTElDRV9GX01PUkUuIFdpdGggU09fU05EQlVGPTEy
OE0gdGhlIGNhbGwgc3BlbmRzIDE1MiBtcyBvbi1DUFUKICBhbmQgYWxsb2NhdGVzIGFib3V0
IDUxNCBNQiBvZiB0cmFuc2llbnQga2VybmVsIG1lbW9yeSBiZWZvcmUgcmV0dXJuaW5nCiAg
RU5PQlVGUzsgd2l0aCB0aGUgcGF0Y2ggaXQgcmV0dXJucyAtRU1TR1NJWkUgaW4gMC4wMyBt
cyB3aXRob3V0CiAgYWxsb2NhdGluZyBhbnl0aGluZy4KCi0gVGhlIHBhdGNoIHdhcyBidWls
ZC10ZXN0ZWQgb24gdjYuMTIuOTYsIGFuZCB0aHJlZSBjYXNlcyB3ZXJlIHZlcmlmaWVkIG9u
CiAgdGhlIHBhdGNoZWQga2VybmVsOiB0aGUgZGVnZW5lcmF0ZSBnZW9tZXRyeSAocmV0dXJu
cyAtRU1TR1NJWkUpLCBhCiAgemVyby1wYXlsb2FkIGRhdGFncmFtIG9mIGV4YWN0bHkgbXR1
IGJ5dGVzIChzdGlsbCBzZW5kcyksIGFuZCBhIG5vcm1hbAogIGZyYWdtZW50YXRpb24gcGF0
aCAodW5hZmZlY3RlZCkuIFRoZSBzZXJpZXMgYWxzbyBhcHBsaWVzIGNsZWFubHkgdG8KICBj
dXJyZW50IG1haW5saW5lLgoKSSBjYW4gcG9zdCB0aGUgcmVwcm9kdWNlciBpZiB0aGF0IGlz
IHVzZWZ1bC4KClRoYW5rcywKRGFpIFdlbmppZQoKCgrljp/lp4vpgq7ku7YK5Y+R5Lu25Lq6
77yabmV0ZGV2LWJvdCtzaW5mbyA8bmV0ZGV2LWJvdCtzaW5mb0BrZXJuZWwub3JnPgrlj5Hk
u7bml7bpl7TvvJoyMDI25bm0MTHmnIgyMeaXpSAxNDo0MwrmlLbku7bkurrvvJpEYWkgV2Vu
amllIDwzNTk2NDE3NzQwQHFxLmNvbT4K5oqE6YCB77yabmV0ZGV2IDxuZXRkZXZAdmdlci5r
ZXJuZWwub3JnPiwgRGF2aWQgUyAuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4sIEph
a3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+LCBFcmljIER1bWF6ZXQgPGVkdW1hemV0
QGdvb2dsZS5jb20+LCBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+CuS4u+mimO+8
mlJlOiBbUEFUQ0hdIGlwdjY6IHJlamVjdCBkYXRhZ3JhbXMgdGhhdCBsZWF2ZSBubyByb29t
IHBhc3QgdGhlIGZyYWdtZW50IGhlYWRlcgoKCkhpIQoKVGhpc8KgaXPCoGFuwqBhdXRvbWF0
ZWTCoG1lc3NhZ2UuwqBUaGlzwqBzZXJpZXPCoGxvb2tzwqBsaWtlwqBhwqBmaXgswqBidXTC
oGl0cwpjb21taXTCoG1lc3NhZ2VzwqBzZWVtwqB0b8KgYmXCoG1pc3NpbmfCoHNvbWXCoGlu
Zm9ybWF0aW9uOgoKwqAtwqBIb3fCoHRoZcKgaXNzdWXCoHdhc8KgZGlzY292ZXJlZCzCoGUu
Zy7CoGhpdMKgaW7CoHByb2R1Y3Rpb24swqBoaXTCoGR1cmluZwrCoMKgwqBkZXZlbG9wbWVu
dCzCoHN5emJvdMKgcmVwb3J0LMKgbWFudWFswqBjb2RlwqBpbnNwZWN0aW9uLMKgTExNwqBv
csKgc3RhdGljCsKgwqDCoGFuYWx5c2lzwqB0b29swqBzY2FuLgoKUGxlYXNlwqBkb8Kgbm90
wqByZXBvc3TCoHRoZcKgc2VyaWVzwqBqdXN0wqB0b8KgYWRkcmVzc8KgdGhlwqBhYm92ZS7C
oEluc3RlYWQsCnJlcGx5wqB0b8KgdGhpc8KgZW1haWzCoHdpdGjCoHRoZcKgbWlzc2luZ8Kg
aW5mb3JtYXRpb24swqBzb8KgdGhhdMKgcmV2aWV3ZXJzCmNhbsKgdGFrZcKgaXTCoGludG/C
oGFjY291bnQuCgoqSU1QT1JUQU5UKjrCoElmwqB5b3XCoGRvwqByZXBvc3TCoChmb3LCoG90
aGVywqByZWFzb25zKcKgLcKgcGxlYXNlwqBpbmNsdWRlCnRoZcKgcmVsZXZhbnTCoGluZm/C
oGluwqB0aGXCoGNvdmVywqBsZXR0ZXLCoG9ywqBjb21taXTCoG1lc3NhZ2VzLgotLcKgClRo
ZcKgZXZhbHVhdGlvbsKgaXPCoGRvbmXCoGJ5wqBhbsKgTExNwqBzb8KgaXTCoG1hecKgYmXC
oHdyb25nLMKgaWbCoHlvdcKgdGhpbmsKdGhhdMKgaXPCoHRoZcKgY2FzZcKgcGxlYXNlwqBy
ZXBsecKgYW5kwqBleHBsYWluLgoK

