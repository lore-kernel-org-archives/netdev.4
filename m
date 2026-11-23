Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443947;
	b=Y3ScfkEsHyYnb86AQZUtW4LbEpzvQ8JsqWGe5lKla5nd7IwfrfW+1OseRyig8HzTKrVY
	 HdU4FJ4IhWq6C1/XFhBuRFOCve/DsJwMx5CdPNp1w1ljRnvuKIcfN2XoV+0V6WeJDk9X0
	 ADC07OAPB4ZZ2QUkrARp3cDwUiQdt01JpCKEButXtxf7IL4no6LE/aEa9j2nRZkshyxII
	 IIAmBeemR3UUxC3MXiN6u2uBEw/T92ruZ9V+EUpG+tVGM+CF4p1D/9Bsz1McNHT9R4iOh
	 zv3rwQGV4gqGFco2jTtwwEJaUPpVYqavF/SKPoxXIlNizwoCjaG1zZCiOSl7P/XPrTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443947;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
	b=PCEq1NBl1h/shw1ZySsUMVSRr0CZBHEzdSu3ZhXO5C5Z8ZqznVgD0xXCbSPKwhGYJWOw
	 K7KXDWxT4Wr4YaUZm4CncMz1c2KzXMvIJ0iMgfcZuRqlCu+60gnCInLfL/Lrwdx0RjaNd
	 HpHpYyPJ4Rbh3UI51N7MxWMDt/S8hkvSEoXOAestC/r6tCT51/HiBMIFPE7vCGFsWMd5U
	 Mks78YArpuVJRGWPxpkC48STZQmU2dyVLj9ZmHn4ADnN0xPjd/i3LHbj7I51M8Bh3e6bg
	 EEhio/usFezc+qJWNqySzkf69hmd2UkyhNIVINle2RQFjL4UlzM3LSFkFsxWoofv+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgXvSsKl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EyCeo9KV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92227606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92227606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgXvSsKl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EyCeo9KV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795443945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
	b=LgXvSsKlPakd7uYc27D7BnIE4UDFrHy1apvyc59uqVg2ei8HQ/bHLMtaf1GJOK48oltgO+
	inL/abcbVyXSJc4u1bwTDqVDpeTbqVxfzFH9PqLxzkKdbGFc/atEsMBSL/D/AwMWwrEIT9
	oatRVxCE8DNkt2uZ3f9bbbCXYCSXhq8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-l4CRSzYdPnW861gbkmxteQ-1; Mon, 23 Nov 2026 14:25:43 +0000
X-MC-Unique: l4CRSzYdPnW861gbkmxteQ-1
X-Mimecast-MFC-AGG-ID: l4CRSzYdPnW861gbkmxteQ_1795443942
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49090fde23aso2091867f8f.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795443942; x=1796048742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
        b=EyCeo9KVSS1jJ8bnW9XNbLBiaXRazjmE+WmLAfyf0V+72j/WeGV9VkgW/NFdEoYDAv
         ORskZH889xizBAzTBpBE0oeXHTi7WK/HVKKAzqVLkMNS4SFAIjpkH5lQp2WUhOwcj6w2
         U+68g6SlVLmQQSVG1B/GNX3jmbrdCil4BWXCROKK7fpzfYPy7uMgdJe9GjrTbhzeeK/P
         p4RcEqUPgFtGzS/7Ria+0136rvsd06Bid2RFCswDyUcBQNRS4GWqMJ+lVxcipKuZwFzs
         jAUWWrXeqQysb19AeRl5dq1+VbBViLB6bZiEpAEq1sKBR+LFvPoI0QvRVzvOc23WlG0g
         8sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443942; x=1796048742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
        b=QpNlBvG4Sbti5UfeBKOw4G4SlXcbEjdlpuakEVzfE71aPolACloWtYPtM0Z9DnwTLc
         RGLs3Roc2TgmwhZnqrhcchCmb2vRY6t0d8/zl5QmUcDLytHCWlLB5gDC0xDFRGEMCR2x
         gduXGqPIL/Bu+tGo8KJ/le9ZKE69vR/ny+LrC1xYf26MLTN8DirDUbc/3buXQCfX+xnM
         2OjxD01d75OYptfPuRisb9fGg7PaASqMM64k9hZO0zGEay4dldA8VVZgTqfy8JoroInp
         P5luyPX9uPAPId8epWC1JaSZLdH6XRDkayfB7eJDszn4L1NcHQpDMfG7R+T/CBaH00F5
         6PAQ==
X-Gm-Message-State: APuU4Z+86Gob1GHJRq+5ffjRv3Qm7ZP3wtE66T4BAQIKeoHWdXXJODxz
	HC4hZK/Io5AGJ9TquXSy//2vifv2m0adyHjEswOGc5pNe3V1QLwVt9gkMIKdO/piGhsv7E9yxqX
	TyaW9TU7D/h5WJvJt0EgIT2QdMZ/GIlQVzTI362u76Nk0PgaKJJNNoMdbpA==
X-Gm-Gg: AZFdTZfRqqgB1CM2jcujhVIJv+XBDOb82uNbV2+WcuneWVed/e8YKsw4WwhwnucQ+K8
	nItkm/7IuxKVDpuq7SUkACU3WAOrgrhfR5qys5t/PK7t8tiJ4Mwr2BD978+qZMVgxcxnsFni8hs
	93o1nhzIClrK/WtvoYgjtyjapUDYCm0+mY/QQIvmxXKC2uzMvDMtPOmn8n9FPCasdCEJP76vefh
	mfQ0FGR8baAXzZw6/cozec7TwT+vx4yJH5Fj3mF+X6hROndzY8SzJFH9u2wzakv4bo6BpWcJdv3
	4HpAcJ3fYqVAbpsdkX/OflFf9WgJ3FDKk+7EF8bcQoV82w3UKSW2X3fTS1WMkn8ZQ3n4mlQxxc2
	C8RzWsZhfKDSzFrGwrPM4DhZPTLAywFYtMadEd4C/D94VxMD9ODJ74uLlhHAJXDk7iVSoAMXcDv
	7P5cVfCdo40s4jSKNv0Qt3dH78sA/PTZhtEoeUDbw0hCkw
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr22673181f8f.56.1795443941784;
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr22673141f8f.56.1795443941433;
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22660754f8f.51.2026.11.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
Message-ID: <e6811e96-20df-49fd-a5b9-d343047dbd7b@redhat.com>
Date: Mon, 23 Nov 2026 15:25:40 +0100
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
Subject: Re: [PATCH net] mctp: i3c: Fix potential thread leak on registration
 failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 15:48, Guangshuo Li wrote:
> mctp_register_netdev() can fail before netdev registration begins,
> leaving the TX thread and bus list entry allocated. The error path
> assumes ndo_uninit has already cleaned them up.
> 
> Always clean up on registration failure. Make bus cleanup idempotent
> because later registration failures can already have called ndo_uninit.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: c8755b29b58e ("mctp i3c: MCTP I3C driver")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Issues in error paths in device init/shutdown existing since the
beginning don't qualify for 'net' target. Applying to net-next.

/P

