Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618444;
	b=ZidQ7yPggvCRvpo0kkp07AN8msst1/DXjG2E2/45nI/EONExfUPckJpCuM7oIwRLTtxD
	 UpMmoMmcpN3XwPvdOtRT6yaC1JvVkWX17QmOt8OPHTfWwKIX833FRshJhxRppHOHqJCVK
	 6q1xiLC/HIQkJ7hE+A1HpXfpqLQ0WbAfzkCPg9qJpI8XU3k8y+0yXRiFvJWpx+QKWosHu
	 pRlMR39fREay9mqWQtbsZqYiNwtHeK6PMKxLTsZx++J0Do3+DW2TAzdmk66iaKuzWv13o
	 FtxmFwPra13OItBn8heH5sypYrmmRrBn0N9eNNBaHo4hE3Cd1EQWq7og5Mp8ILoUTlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618444;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=vzLkSydp7PD+Gv983MWb/eejnWLUpGr6ghIvtugEqmR8Mi6Hx8j7WPrES8eBtTzpNZk1
	 yMd6U5HIZCtGyouG3iFTjJVf72xHgwUst5Uy+LZ2rFhqnZjizaSFC/kR7n/2HrYD5hzYM
	 2kg8CByD8dRx9WjgeT2nKvfgal53E5geZp6a/17qrfns3ycR5uI+omGeBGDbem6qy4esq
	 hWybEetR20O+VG+jfNA77D+0mCvB4pnxBa0R4aetXSiyo2Y67SvVZQflfdkve2rPOIz80
	 UD8pamIU8rx9Av7OaAMKSnY2QlhfV1aQsluj4NE5uYTl6I81eDvznfKIlu612o+fqsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dMAIx3IT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C658606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C658606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dMAIx3IT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=dMAIx3ITXCfH7guACr7zctorvtzz+BnDtFlFI425XAVLqK5Ufa5WhB4YM2VtpXQ+0yC3Kh
	sN5dCzbsDCNsGCabgfngNC+ElnHRPWvTeMsorFudC1/5+hAjCjFHbf79Dc8MDUj0pVoug9
	+25eWZyze/pU546RMzLCl1Sen9MMmuc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ijEDHFzgOu2ulsuYaY_ETA-1; Wed, 25 Nov 2026 14:54:00 +0000
X-MC-Unique: ijEDHFzgOu2ulsuYaY_ETA-1
X-Mimecast-MFC-AGG-ID: ijEDHFzgOu2ulsuYaY_ETA_1795618439
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so36454855e9.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618439; x=1796223239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=pn33URwv492/HgJMJYAPaj3LAp2loLgbZN6cf79qpiyUas/ua1yZcjWlBXoQmio+DO
         pKWG+CSXc/uz0MLXP5nRb1PRAT7XlEx55YX27md56PbAjzhh+0zeQ0fLtChkeGQ8Mylg
         3ngI/Q8HpTi6tNmxTHVELnwFnVP+g3fc5T8gDg4G+GLZ/KDHr/alx7ryyxYs5qT7dUVe
         DPr+Tcld1O2+DvGYGHz7nnsPcDhcGHzgxfVd79DW8tQTQxAPejz/RcmOJgSGq35gFODh
         pgxwLkiAZGWR1gz5VzrtGJEOcPLgdRd+OV3o/ngQRzV4IScRAHflB7uJzWSQp8R/iBIs
         oXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618439; x=1796223239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=Z29Qthl1micJFVORmy0wn3oyOJM8SdM6x5thMzaG99w5+BrgTevuy/cUU55TslBLQn
         a3tW7yV0cLbjAUXsIgjxoFRsdNv7lR9x8hr3oxjMmBaICb6/3Y1Sk+inX05HjPUfpEYQ
         tngwQ2Qbrbip604F+Kzs2q50yVyRpmVYi3Bthxxa2IbX7OrGaD/7G9ipbuFw0uULuWhI
         /EhSFyHKWe9ZdSJ8vs7kQGSxxTmMYf8hnt5EOzRfaFV3bIDCzWsvvywXdE7Zhwtr+id8
         O9GBpvqEl6KJeHZhSGIWSDSNL0JA3Xng4QbiE9HB2WWr7eSavB2bAh0swALTn5uezUgC
         Horg==
X-Forwarded-Encrypted: i=1; AL+hErEw8Uor4oqjbKLd9Dxr6Gn6e0jxXTtztmmHlhPiFGzw56ICeGZl5wcXY7fcDjY5g3w1hx6h024=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CRgzr5d5s+CX9RrPKlILbjLlw39ZTCrNtuhTAE4NcwiPxECzp
	leN6uHOzL/j8FR5VCHpMFdfCNtmzCCnmirjPnKitPcitdlAR0nks3tKpIG2l/MOc68b2NRmlDY+
	+7fcHPWeJYhQEQn/c6ljVALh7WqyYH1W4dJC30zpDGaQlDkKQjCYTOmLtyQ==
X-Gm-Gg: AZFdTZc6BQEa29bBr9O6jjZDNoeLXhxgmrjLvOB/gMerYvdYksKT0O/4Nxx4V6Nti+m
	34C24vw/T2PRb31UvZFtU4wpkdO9qjL2ZlUjqqfRC5YKNcjLGdBlIY58uXtTcscx7zjTTcgwepK
	BAfnxC2Zyk94HM7jRV9GhmXTUHHFj8vSUpVQAJHQEHDuLe1ge+sdPgwjsFvyD+OI9XL0+EsFSKd
	u4l0DzBY2ol7k84BZp9rWvZSwFXv7mdomm0XEKxL1tKJoqOC7uYA3pLZJI0h+9y9e/lwyFNpPza
	HHtUr+xtr1n2KjcBacHXx9jA65Zn55HXkNe6RAoroVE1K/Is7/eOvTgYUnFlmMEiVZR5zXvghjA
	Ey5G8xOBuBUII+sXSR1MyT4Ev0Rw4H5PJByFAVWKxmMA4xM0HWED7X1fKo5R8xYmC9KwQ8lW1dw
	78xVmBoG2BDnDHP/1A+7dJZZ5LmYX47JU0UrDNXepLi/to
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442506075e9.12.1795618439033;
        Wed, 25 Nov 2026 06:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442505685e9.12.1795618438641;
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm33028179f8f.18.2026.11.25.06.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Message-ID: <31551b64-3286-4f75-8b6c-b18e42286545@redhat.com>
Date: Wed, 25 Nov 2026 15:53:57 +0100
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
Subject: Re: [PATCH net-next v3 0/2] netdevsim: add TLS device offload
 emulation and test
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:48, Jiayuan Chen wrote:
> Running kTLS over this already found a few bugs:
> 
>    b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()")
>    ed642349d87d ("tls: fix the open record check in the max payload size setsockopt")
> 
> So I think it is worth sending a formal patchset.  v1 [1] was asked to
> wait for a selftest that can also run against real hardware.  That test,
> drivers/net/hw/tls_hw_offload.py, is in the tree now, so this can move
> forward.
> 
> The kTLS device offload path in net/tls/tls_device.c has no test
> coverage upstream -- selftests/net/tls.c is software only, and the
> offload code needs a driver that implements it.
> 
> So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
> advertises the TLS features.  Patch 2 lets the existing hardware offload
> test, drivers/net/hw/tls_hw_offload.py, run on netdevsim as well, so the
> same test covers real devices and the netdevsim pair CI already uses.
> 
> No crypto is done, like the IPsec, MACsec and PSP emulation netdevsim
> already has: TX puts the plaintext record on the wire.  That only works
> with netdevsim on both ends and offload on in both directions, which is
> what the netdevsim environment of the drivers/net tests gives.  It still
> covers record assembly and the offload lifecycle.
> 
> [1] https://lore.kernel.org/netdev/20260901154914.11637-3-jiayuan.chen@linux.dev/
> 
> v2 -> v3:
>    - fix the build with CONFIG_IPV6=n (kernel test robot)
>    - address some of the issues Sashiko reported
> v2: https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@linux.dev/
> v1 -> v2:
>    - drop the netdevsim-only selftest, run the upstream tls_hw_offload.py
>      on netdevsim instead so the test also covers real hardware (Jakub)
>    - rebase on net-next
> v1: https://lore.kernel.org/netdev/20260901154914.11637-1-jiayuan.chen@linux.dev/
> RFC (July): https://lore.kernel.org/netdev/20260728125658.390500-1-jiayuan.chen@linux.dev/
Applied, thanks!

Paolo

