Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509734;
	b=HbCrxPFXQEWTFlpFQ4RKUOH/58YUdzmoSUy6tBKY3dzApMwbz0WTBtiqQO8F74hKrzHR
	 KYDJ8zA7n0bjdLmFtcNnwk2mADsCzaP8rawOUp4YiUkVkwh3kG9olD746hKEULKexavX+
	 vkModAtpcV8xaD4fludYFQlgRzXTRrO96pyGhfu6oAfriwBGe0CZ+1z6arqcifiBkYBbw
	 sRmINmUlzLB8GLy3Ui3JLYm6lW3jmXiONyF060aNlkamtleAUiQTlWyyY/IB5PpbcTEve
	 +mJDl0BIpWfAtrFcqYN5RdRyh5cDwHPhMOlU0/+ovqIDF6nAeebtcQbgOlGzkC9+5SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509734;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=yayRZDW92bf30dpBjibbBJc+yczvJ6DpFo7UtXjysZw=;
	b=ZYdZCoEgYGlkGc/MetUdRf4haqUKT1+vDExYC9Mghu1jeEIH2eT9DX320VLj9fiwJrs+
	 g0dTi02afpNkMKAEyJJrLyVCB29H1QCarm8IB5JODqHvn9i786vSH+3pmDZLLzaq5+HUv
	 KUyyZY2DYJnipEuuKQyxwE9Zv40DdQhNknhjzctNPGLTLhnlJkKVEX8z8I8uPkwkwLidR
	 aW/9YP+f3kBd3J/h870BRXH/KaKqd39Q86HcEpI6wK0MwQbfK+N9Ld1fPlhhTE8qnYwKy
	 O7c0ELN1C98OllDn2/jfKFq6FnyvdsTQaHzN8IZfKj9u3X7GDSSJ6c0qwxrFZVNyRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="L3/Y6Eh1";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B364606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B364606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=L3/Y6Eh1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=yayRZDW92bf30dpBjibbBJc+yczvJ6DpFo7UtXjysZw=; b=L
	3/Y6Eh1xs4kDKTYpkthJhOAp+1yM9ezn6rcQqIr8Rin+BT0o1IefB/w1ZcyV8WZx
	+jgbTqDsoI+HoTN49xwOxrwss0b327FYsSo0xPpn0giuB1TK9cnkkcDfe/pwNLoU
	Ibvi+DmGxX1xWhtnbFd6j50wBznnCsPRjmJRhMZk+k=
Date: Tue, 24 Nov 2026 16:41:41 +0800 (CST)
From: "Lange Tang" <lange_tang@163.com>
To: "mst@redhat.com" <mst@redhat.com>
Cc: "Jakub Kicinski" <kuba@kernel.org>,
	"Eugenio Perez" <eperezma@redhat.com>,
	"jasowangio@gmail.com" <jasowangio@gmail.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"Tang Longjun" <tanglongjun@kylinos.cn>
Subject: Re:Re: [PATCH v2 0/3] virtio_net: introduce an RX queue watchdog
 for stuck detection
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261120124403-mutt-send-email-mst@kernel.org>
References: <20261120071826.198604-1-lange_tang@163.com>
 <20261120124403-mutt-send-email-mst@kernel.org>
X-NTES-SC: AL_Qu2SB/mbtk8r5yCeZ+kfmUgRg+c/XsK4svUj24VVOJF8jCLp+DAKRVFkMFj68MSsEweXrCCTSQJo+MZ4UoV4b7gk/Q7RC/TvJ0wiTAZRuKXh8Q==
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
Message-ID: <41f156cf.73ac.1a20cb7c9d3.Coremail.lange_tang@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgD3vwHGTQVroth0AA--.361W
X-CM-SenderInfo: 5odqwvxbwd0wi6rwjhhfrp/xtbC-QagzmsFTcZzeQAA36
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMS0yMSAwMTo0NToyMiwgIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQu
Y29tPiB3cm90ZToKPk9uIEZyaSwgTm92IDIwLCAyMDI2IGF0IDAzOjE4OjIzUE0gKzA4MDAsIExv
bmdqdW4gVGFuZyB3cm90ZToKPj4gSGkgTWljaGFlbCwgS3ViYSwKPj4gCj4+IEkgb25jZSByYW4g
aW50byBhIHByb2JsZW0gd2hlcmUgdGhlIHZpcnRpb19uZXQgcmVjZWl2ZSBxdWV1ZSBiZWNhbWUK
Pj4gcGVybWFuZW50bHkgc3R1Y2suCj4+IAo+PiBUaGUgdmlydGlvX25ldCBSWCBwYXRoIHJlbGll
cyBvbiBiYWNrZW5kIGludGVycnVwdCBub3RpZmljYXRpb25zLgo+PiBUaGUgYmFja2VuZCh2aG9z
dF9uZXQvdmhvc3QtdXNlcikgYXBwZW5kcyBidWZmZXJzIHRvIHRoZSB1c2VkIHJpbmcKPj4gYW5k
IHRoZW4gbm90aWZpZXMgdGhlIGd1ZXN0LCByZWx5aW5nIG9uIHRoZSBoeXBlcnZpc29yKEtWTSkg
dG8gaW5qZWN0Cj4+IHRoZSBpbnRlcnJ1cHQuIE9uIHJlY2VpdmluZyBpdCwgdmlydGlvX25ldCBz
Y2hlZHVsZXMgTkFQSSwgZHJhaW5zIHRoZQo+PiB1c2VkIHJpbmcgYW5kIHJlZmlsbHMgZGVzY3Jp
cHRvcnMuCj4+IAo+PiBJZiB0aGUgaHlwZXJ2aXNvciBmYWlscyB0byBpbmplY3QgdGhlIGludGVy
cnVwdChlLmcuIGEgdHJhbnNpZW50IEtWTQo+PiBmYWlsdXJlKSwgdGhlIGd1ZXN0IG5ldmVyIHNj
aGVkdWxlcyBOQVBJLCBzbyBpdCBuZWl0aGVyIGNvbnN1bWVzIGJ1ZmZlcnMKPj4gbm9yIHJldHVy
bnMgZGVzY3JpcHRvcnMuIFRoZSBiYWNrZW5kIGtlZXBzIGFwcGVuZGluZyB1bnRpbCB0aGUgcmlu
ZyBpcyBmdWxsLAo+PiB0aGVuIHN0b3BzIGFuZCwgd2l0aCBubyBmcmVlIGRlc2NyaXB0b3JzIGxl
ZnQsIGFsc28gc3RvcHMgc2VuZGluZwo+PiBub3RpZmljYXRpb25zLiBCb3RoIHNpZGVzIG5vdyB3
YWl0IGZvciB0aGUgb3RoZXIsIGFuZCB0aGUgUlggcXVldWUgaXMKPj4gcGVybWFuZW50bHkgc3R1
Y2suCj4+IAo+PiBUaGUgcm9vdCBjYXVzZSBpcyB0aGUgbG9zdCBpbnRlcnJ1cHQgaW4gdGhlIGh5
cGVydmlzb3IsIGFuZCB0aGUgcHJvcGVyCj4+IGZpeCBiZWxvbmdzIHRoZXJlLiBOZXZlcnRoZWxl
c3MsIEkgYmVsaWV2ZSB2aXJ0aW9fbmV0IG5lZWRzIGEgd2F5IHRvCj4+IG9ic2VydmUgYW5kIGRp
YWdub3NlIGl0LiBUb2RheSwgb25jZSBhIHF1ZXVlIGhhbmdzLCB0aGVyZSBpcyBubyBzaWduYWwK
Pj4gdG8gdGhlIG9wZXJhdG9yIHRoYXQgYW55dGhpbmcgaXMgd3Jvbmc6IHRoZSBSWCBwYXRoIGhh
cyBubyBlcXVpdmFsZW50IG9mCj4+IHRoZSBUWCB3YXRjaGRvZyAobmRvX3R4X3RpbWVvdXQpLiBU
aGlzIHNlcmllcyBsZXRzIHZpcnRpb19uZXQgZGV0ZWN0IGFuZAo+PiByZWNvdmVyIGEgc3R1Y2sg
UlggcXVldWUuCj4+IAo+Cj5XaHkgdmlydGlvIG5ldCBzcGVjaWZpY2FsbHk/CgpDb21wYXJlZCB0
byBhIHBoeXNpY2FsIE5JQywgdGhlIGludGVycnVwdCBpbmplY3Rpb24gcGF0aCBvZiB2aXJ0aW8g
bmV0IGlzIApsb25nZXI6IGhvc3QgYmFja2VuZCAoUUVNVS92aG9zdC11c2VyLCBoZXJlIE9WUy1E
UERLKSAtPiBldmVudGZkIC0+IGlycWZkIC0+CmluamVjdGVkIGludG8gdGhlIHZDUFUgYnkgS1ZN
LiBUaGlzIHBhdGggbG9zZXMgaW50ZXJydXB0cyBtb3JlIGVhc2lseSB0aGFuIGEgCnBoeXNpY2Fs
IE5JQy4gT24gYmFyZSBtZXRhbCB0aGUgaW50ZXJydXB0IGlzIGEgc2luZ2xlIGhhcmR3YXJlIGhv
cCBhbmQgc3RheXMgCnBlbmRpbmcgdW50aWwgdGFrZW4sIHNvIGl0IGNhbm5vdCBiZSBtaXNzZWQu
Cgo+Cj4KPj4gSW1wbGVtZW50YXRpb24KPj4gLS0tLS0tLS0tLS0tLS0KPj4gCj4+IFBhdGNoIDEg
ZXhwb3NlcyBsYXN0X3VzZWRfaWR4IHRocm91Z2ggYSBuZXcgaGVscGVyLCB3aGljaCBpcyB1c2Vk
IGJ5IGJvdGgKPj4gdGhlIHNwbGl0IGFuZCB0aGUgcGFja2VkIHJpbmcgYW5kIGRlbm90ZXMgdGhl
IHBvc2l0aW9uIHRoZSBkcml2ZXIgaGFzCj4+IGxhc3QgY29uc3VtZWQuIFRvZ2V0aGVyIHdpdGgg
dGhlIGV4aXN0aW5nIHZpcnRxdWV1ZV9wb2xsKCksIGl0IGxldHMgYQo+PiBkcml2ZXIgYXNrIHdo
ZXRoZXIgdGhlIGRldmljZSBoYXMgcHJvZHVjZWQgYnVmZmVycyB0aGF0IHRoZSBkcml2ZXIgaGFz
Cj4+IG5vdCBjb25zdW1lZCB5ZXQgKCJiYWNrbG9nIikuCj4+IAo+PiBQYXRjaCAyIGFkZHMgYSBw
ZXItZGV2aWNlIFJYIHdhdGNoZG9nIHRoYXQgc2NhbnMgYWxsIFJYIHF1ZXVlcyBvbmNlIHBlcgo+
PiBzZWNvbmQuIEEgcXVldWUgaXMgY29uc2lkZXJlZCBzdHVjayB3aGVuLCBmb3IgNSBzZWNvbmRz
LCBhbGwgb2YgdGhlCj4+IGZvbGxvd2luZyBob2xkIHNpbXVsdGFuZW91c2x5Ogo+PiAgIC0gdGhl
IHF1ZXVlIGhhcyBhIG5vbi16ZXJvIGJhY2tsb2cgKHVuY29uc3VtZWQgYnVmZmVycyk7Cj4KPgo+
d2hhdCBkb2VzIHVuY29uc3VtZWQgbWVhbj8KClRoYXQgdGhlIGRyaXZlciBoYXMgbm90IHRha2Vu
IHRoZSBjb21wbGV0ZWQgYnVmZmVycyBvdXQgb2YgdGhlIHF1ZXVlIHlldDoKdGhlIGRldmljZSBo
YXMgcHVibGlzaGVkIGEgY29tcGxldGlvbiAodmlydHF1ZXVlX3BvbGwoKSBpcyB0cnVlKSBidXQg
dGhlIApkcml2ZXIgaGFzIG5vdCBjb25zdW1lZCBpdC4gCgo+Cj4+ICAgLSB0aGUgZHJpdmVyIG1h
a2VzIG5vIGNvbnN1bXB0aW9uIHByb2dyZXNzIChsYXN0X3VzZWQgdW5jaGFuZ2VkKTsKPj4gICAt
IG5vIG5ldyBpbnRlcnJ1cHQgYXJyaXZlcyAocnEtPmNhbGxzIHVuY2hhbmdlZCkuCj4+IE9uIGRl
dGVjdGlvbiBpdCBsb2dzIGEgd2FybmluZywgcmF0ZS1saW1pdGVkIHRvIG9uY2UgcGVyIHRpbWVv
dXQsIGFuZAo+PiByZXNjaGVkdWxlcyBOQVBJLCB3aGljaCBkcmFpbnMgdGhlIHJpbmcgYW5kIHJl
ZmlsbHMgdGhlIGRlc2NyaXB0b3JzLAo+PiBzbyB0aGUgcXVldWUgcmVjb3ZlcnMuCj4+IAo+PiBQ
YXRjaCAzIGFkZHMgYSBwZXItcXVldWUgc3RhbGxzIHN0YXRpc3RpYywgZXhwb3NlZCB2aWEgZXRo
dG9vbCAtUywgc28KPj4gdGhlIG51bWJlciBvZiBzdHVjayBldmVudHMgY2FuIGJlIG9ic2VydmVk
IHBlciBxdWV1ZS4KPgo+Cj4KPj4gcXVlc3Rpb25zIGFuZCBjb21tZW50cyBhcmUgd2VsY29tZS4K
Pj4gCj4+IFRoYW5rcyEKPj4gTGFuZ2UKPj4gCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gMS8zOiBm
aXggdGhlIGtkb2MuCj4+IC0gMi8zOiBkcm9wIHRoZSBtb2R1bGUgcGFyYW1ldGVyLCB1c2UgYSBm
aXhlZCA1cyB0aW1lb3V0Lgo+PiAtIDMvMzogcmVuYW1lIHJ4X3RpbWVvdXRzIHRvIHN0YWxscy4K
Pj4gCj4+IExvbmdqdW4gVGFuZyAoMyk6Cj4+ICAgdmlydGlvOiBhZGQgdmlydHF1ZXVlX2dldF9s
YXN0X3VzZWRfaWR4KCkgaGVscGVyCj4+ICAgdmlydGlvX25ldDogaW50cm9kdWNlIGFuIFJYIHF1
ZXVlIHdhdGNoZG9nIGZvciBzdHVjayBkZXRlY3Rpb24KPj4gICB2aXJ0aW9fbmV0OiBhZGQgc3Rh
bGxzIHBlci1xdWV1ZSBzdGF0aXN0aWMKPj4gCj4+ICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMg
ICAgIHwgMTA1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgIDE4ICsrKysrLQo+PiAgaW5jbHVkZS9saW51eC92aXJ0
aW8uaCAgICAgICB8ICAgMiArCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gLS0gCj4+IDIuMjUuMQo=
