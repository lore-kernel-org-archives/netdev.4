Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688194;
	b=GQnEdo81f+EA6RzI9GeLlANz9m1I+pzYfZYFAUHeelkY2uzbSYR91z6pVTBiNC80HfbE
	 MOUZ3CB6XLluNxC3ct88XZiUqSNl772YMupMQd3wyAwdn+B9I5RbfH2Uv2msmNpjxbbcy
	 qmkGAbxQsIM1PlD8wIGaUAKbYa/j5e3v0nqDtnJq2G+GG/Mo8L/gnfpke9clqkK44pNsv
	 bgPV7ABF+7TRTJ3WEiM3b2aqCFe6hpawF7YaAWByjwbUWR184bl1D2izXSX/PG08LczES
	 cSlavahz1sr17GhjgKJ8hBkwr7MUhzopYUCekrOXjy/+rGPiWzrXptW1cLl9smrf6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688194;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References;
	bh=wGaSQsQ3giXHPy9oJ/OeKyvcz0JPZIw0NoZ2eF1yjZk=;
	b=T+AHFemnieVsDcjOIM/J14Prs4GX1F+bpVB5dEwBae0InoKlNuVCoPI22+YSSh92YA17
	 TJifHBIiD1V26zxcr/r2MWYJOoo50EZ/EMaDjz0wXlmTsgxJdpMJQzRcLp2BtsKubF2pc
	 1RY+X3CMDP91WtBiUtelT01//823XP7Z97DeHefHZrHW5hEAQj4zuVhiPI9a9+en7TtqG
	 NA8a/1DGhK2BkAr6L4s8iprvFzLlGboKETLNGW3OkjHcQ0LLGywnmhKlfprw0TYDCbFYx
	 key5LUZUgPKVWRRwZ786Uvw7jXNGWVGxjeW7J1FzcWGdDZYs6LzpQUTEh4LpDx84HCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="JIxZ1/VD";
	arc=none smtp.remote-ip=43.163.128.49
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A3D606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JIxZ1/VD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795688184; bh=wGaSQsQ3giXHPy9oJ/OeKyvcz0JPZIw0NoZ2eF1yjZk=;
	h=Subject:From:To:Cc:In-Reply-To:References;
	b=JIxZ1/VDg9caKggruLFeMYB/+n/DFchVSRzXlclHrzXp+sPeKuGyoknHGrYu+LfxW
	 GWfI93KLKgFB+da9ksra6AqSOOlTuiOJVqSWXQu5opWSX+joRPu+pd8QnIrec1LcEP
	 4d0fERL8lbdg0zLUz4G7waFseYis6w/GMh0hmj7U=
Received: from [127.0.1.1] ([218.28.192.28])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 4150A815; Thu, 26 Nov 2026 18:16:21 +0800
X-QQ-mid: xmsmtpt1795688181takgc7kgb
Message-ID: <tencent_21D314AEB4D8C2C489FB8D74348B93FC7706@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aTrhM7FWxxawz4StD0w7Uc1OE8LPC1uTXzP4zu41Q9Gx14fLm1zy
	 gCBm5lf6+l+I+WBoj3VdED7AvgayXIYzdQdYy0Chthv2Wkpeglj6nYim0d0G+L3IAEH0W82OFXQI
	 5k6FLI3p3Hfk9K74nq8trFK6IwbItuYVQsUThLIbzYT6DNQ/9wC+p7bR0q/Hu9SywOWbgUaSF5j4
	 2Lt6cUY6dAl0kD135M3MiHDOU+IFRwMqBYi/j4R9nvjlC4QddeI/ti3E0JvrhsHOqzUkvYrZnBn9
	 9xz+pTHE8JmPxh+aiYN/Mqu8RANpXs+U2B0lruMYGiMXIr4JEDopMNDo15uJMEzinHSGjapytWgk
	 EmaZYA8ZEiGl3H459KmzunOApJvPsJDVrK7I2pfwYOT6s+bNCKYm2JrzCL1ixI3Ylw6/gfOPo53t
	 OVD6vGtKv73J8s0lP9ObuEQG+mxNk0cNC4Jff297V2ZZKT9QKrms+8Vds+s18yrwt42yJqlEYEhZ
	 NG2Ws631lSLaHaLqOKobo1LnvgEwTY6jgUfeROzERdJaVbhCznywPyaLNv00T3mgvim4RkagninU
	 OCK4T2q6gyHK3HH6nCHYL6Qel4OlGrtwcjExrAXhan+R9vphdlHvWhQWa3alaYlnBl41NwSQXHVQ
	 vRIGvEMNdx4b+IQ2ujFtDMLTDjO611ilPY3BC2N3NXUJx4qzPNpwW2IPTJmp9DU3tSNsU5p9ngNi
	 5dIH0AA09agR4rg8NhkAfg4wTdqsG92ZC3X//LCxHHab+lUXRtn6UdYPdqUTaq0kV1ie2i6ZpGcI
	 WW6zO6yjslcAqWXchCgn81ixFqtSoZCiCldg3g/tErike8EymnI0LR0CZMCxHZm/8WB7Jqo/2AhF
	 2K7YFYwWEKCJW4152PajQGn4ZslFZO9KR1YeLhC/3JJxQrVgIrTPtzzRTGu5GtvSVnLcysB0vI+l
	 V1GNE0msu0K1JHGdgAtHUm6WKlR9cPxsGQxFaz9OcaLEkPiustaZoWErV8GfoPGFdnAcIONyVNF2
	 f99bX+kxZYYV2iDjuHdJQ562bKfLIdMN+t6sTH8ddp6fp3IdUY9GAGxjsw8HEHZVHYf04kktoNuC
	 37ODjm
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH net] tap: do not take consumer_lock in tap_sock_destruct()
From: Shuai Liu <847807867@qq.com>
To: zhangjiayi1014@gmail.com,willemdebruijn.kernel@gmail.com,jasowangio@gmail.com
Cc: andrew+netdev@lunn.ch,davem@davemloft.net,edumazet@kernel.org,kuba@kernel.org,pabeni@redhat.com,mst@redhat.com,847807867@qq.com,netdev@vger.kernel.org,linux-kernel@vger.kernel.org,syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com,syzkaller-bugs@googlegroups.com
In-Reply-To: <20261126090306.3416278-1-zhangjiayi1014@gmail.com>
References: <20261126090306.3416278-1-zhangjiayi1014@gmail.com>

SGkgSmlheWksCgpUaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQgYW5hbHlzaXMg4oCUIHlvdXIgZml4
IGlzIGRlZmluaXRlbHkgdGhlIHJpZ2h0CmFwcHJvYWNoLCBhbmQgeW91IGNhdWdodCBhIGZsYXcg
aW4gbXkgcmVhc29uaW5nIHRoYXQgSSBtaXNzZWQgZW50aXJlbHkuCgpNeSBwYXRjaCBvbmx5IGNo
YW5nZWQgdGFwX3NvY2tfZGVzdHJ1Y3QoKSB0byBhY3F1aXJlIGNvbnN1bWVyX2xvY2sgd2l0aApz
cGluX2xvY2tfaXJxc2F2ZSgpLCBhc3N1bWluZyB0aGF0IG1ha2luZyB0aGUgZGVzdHJ1Y3RvciB0
YWtlIHRoZSBsb2NrCndpdGggdW5pZm9ybSBCSCBzZW1hbnRpY3Mgd291bGQgYmUgZW5vdWdoLiBC
dXQgSSBjb21wbGV0ZWx5IGZhaWxlZCB0bwpjb25zaWRlciB0aGUgb3RoZXIgaG9sZGVycyBvZiBj
b25zdW1lcl9sb2NrOiB0YXBfZG9fcmVhZCgpLCB0YXBfcG9sbCgpLAp0YXBfcGVla19sZW4oKSBh
bmQgdmhvc3RfbmV0X2J1Zl9wcm9kdWNlKCkgYWxsIHRha2UgaXQgd2l0aCBwbGFpbgpzcGluX2xv
Y2soKSwgYW5kIHRhcF9xdWV1ZV9yZXNpemUoKSB3aXRoIHNwaW5fbG9ja19iaCgpLiBTbyBsb2Nr
ZGVwCndvdWxkIHN0aWxsIGZsYWcgdGhlIGluY29uc2lzdGVuY3kgYmV0d2VlbiB7SU4tU09GVElS
US1XfSBhbmQKe1NPRlRJUlEtT04tV30gZm9yIHRoZSBzYW1lIGxvY2sgY2xhc3Mg4oCUIGV4YWN0
bHkgYXMgeW91IGRlbW9uc3RyYXRlZC4KCllvdXIgYXJndW1lbnQgdGhhdCB0aGUgZGVzdHJ1Y3Rv
ciBkb2VzIG5vdCBuZWVkIHRoZSBsb2NrIGF0IGFsbCBpcwpzb2xpZDogdGFwX3B1dF9xdWV1ZSgp
IHJ1bnMgc3luY2hyb25pemVfcmN1KCkgYW5kIFJDVV9JTklUX1BPSU5URVIocS0+dGFwLApOVUxM
KSBiZWZvcmUgdGhlIGZpbmFsIHNvY2tfcHV0KCksIHNvIHRhcF9oYW5kbGVfZnJhbWUoKSBjYW4g
bm8gbG9uZ2VyCnJlYWNoIHRoZSBxdWV1ZSB2aWEgUkNVIGRlcmVmZXJlbmNlLiBUaGUgZGVsbGlu
ayBwYXRocyB1bnJlZ2lzdGVyIHRoZSByeApoYW5kbGVyIGJlZm9yZSB0YXBfZGVsX3F1ZXVlcygp
LiBObyBvdGhlciBwYXRoIGNhbiByYWNlIHdpdGggdGhlCmRlc3RydWN0b3IuCgpBcHBsaWVkIHlv
dXIgcGF0Y2ggbG9jYWxseSwgYnVpbGRzIGNsZWFubHkgYW5kIHBhc3NlcyBjaGVja3BhdGNoIHN0
cmljdAp3aXRoIDAgZXJyb3JzIC8gMCB3YXJuaW5ncy4KClBsZWFzZSBpZ25vcmUgbXkgZWFybGll
ciBwYXRjaCDigJQgaXQncyB3cm9uZyBhbmQgc2hvdWxkIG5vdCBiZSBhcHBsaWVkLgoKUmV2aWV3
ZWQtYnk6IFNodWFpIExpdSA8ODQ3ODA3ODY3QHFxLmNvbT4KVGVzdGVkLWJ5OiBTaHVhaSBMaXUg
PDg0NzgwNzg2N0BxcS5jb20+CgpTaHVhaQ==

