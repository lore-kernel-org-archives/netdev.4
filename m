Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469537;
	b=EqFDYUPY6GxGbHljz/7GREDcBMV+IJ1wug/AY9RWlliMTbUed7UC8vj+WzAYjhsj8lfg
	 HovGVwrr46pOEj9TO9BEbD84LQR095NYYk+XSP+wL3kDn7foeoM/DvnIxcw2jFw5+Rfcd
	 E+8nQZIfsWyB5jsEXxjLIpMSZFscBGJzIfm2f+Ims7HgOtfyhQVrm5BDt3Dhxy1uIBkPC
	 Cw75bs2lmsQW+Q8/vXn/lK/impLKR18jcMr13tzkHr0UsA/hTY2JIUAYsoAM2fVuDorIL
	 fillsANb6oYX5IYK2wbbRm3PE1bZcV9L1pU9yWnDzYGvYvOvp1FSoHqzCDvXsc/e4VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
	b=PokqzDMys0EnxJN5rvVGzwLr7TgGj0wSZTApuclRY735a23RxAMFUvOZ//YZ8flLY9TU
	 D5M8nBpFJ50OwRdwYZ9tkXCoAh3t97YTh9r+Rap9ie0BiBbVTx7bOTZC+v07oJEd3Tsnv
	 Gmwhxk3mvm1zPTy5jD7nrsOc3jRN2DesP6K17iXTcNa6JCX9af5HJ9NTSt9i0LdYusAV/
	 AJ8/2W74TURpOmSFGQY3MSantRlDUI7GIJH7WvufkTXtTPhfi4K8DPF9AZ1tKdgKSmACY
	 IS7Mt5z3+ca8QB/ecp5D3lzvylWA1+4zRx6+usDcJB8CI4Xv0z658Kf5lO+AcFIabMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqG1qpm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A762606A326
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A762606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqG1qpm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb995ade6cso1555525e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795469536; x=1796074336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
        b=QRqG1qpmNHm3CINMJEGFCZVUZIHELj4/YROVzdBghlrKedFgufnZAPMpY5qyvBwUhy
         VXG2uzc4GCyrh29M6DVcTOeOk/X10AO0oLoqOrCTQcA6qOKkuY075ncIJotc5BqGxf3Q
         SZ7LppdbEcXHlQbh5mziFtI17CPDvaCl3BZT/bkDeWMYHQccfYHLlCdzEFUcL6cB7UzC
         oESAP7RI+3rqpO9C4nHf176roq6sbARwbEBk8D7PWNAbN6lLtTtUeQhKn3aIyO/EPoc3
         AsKIkGUGvD7CBVf4nzTez+L1uItMEGA2xKKPPGHMGwdwJ6wV6RxrDczkSJrPv81VOlNg
         TruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469536; x=1796074336;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMcHckr7xzBy87rdjUeibIDdjsNnDgKiiqf5JhMKkgA=;
        b=H83Qoz/SoWZOrgxWn+fSdkNr7KbvJ85HJedSkojHmIeK4Iu0ASAMv0UYFgQwbjcXMp
         ARsr3kdVSUZjx1fYk+NjsWqmvSGN+MwhjudrNGGQGzvXXlA1kJKPvNByOD9Orw6HtYOc
         I3Cui4rrw9rGqqShIJCrmzTD7Z9+nbML94jle3Ce64W7ShnFJ+0tLfXxyD4TXUyAbuZN
         7ikjHUES37W6caCBWSp6HeRIcTKZD2BJGR59krcqvRzRuEC+981yEf4r2KFCuvDaf9BO
         kGDQGndkBmHf8FeUyc85sF4P98vI5mXRSRgjVrNh8EqpPz7BxMyd4qhxWzJq07/Wi03e
         8H9g==
X-Forwarded-Encrypted: i=1; AL+hErE009XAyBke8sn6g/8P/ct5NsGvGXWEXoNMuwy6Ai9PO5z+dNM97uyVV90r9ZkGhpffiO1MDYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H4dLBNic/MH+P1jbS/4jZM7c2EIJ621tArDn0O5eMUwt4fkG8
	By/3O6EXN4tF+kg8UT7ikPYhYz2FylYmA6BkubXxGRYG4yS8WQW0jpux
X-Gm-Gg: AZFdTZdidxGTpASesWjfIuvl80e8sPH6ov41zCyBoiCV7xMzCeQ/U3tycnJ4UDmuUHo
	ZNBHuT+zVn0WYX9mun90dxhfjYoAGY3SxkUR6B/GFhVs5rhI3RvNpmbrCEI8Zh8kYE3HQ1cAxU9
	4wOGDqL0r/dHbzKMHZW4Os8DVlEgXEmW2Gb78GvjMXTcHWN0kfTMRgx6TyRWXrRJArTjOKPbNAD
	f4mmf9VKVX7EMQ1cJTS5lt4YMuJ1z/ceM1/CyfqP6kEGLZZLXf6dVx8le4O/r/LqtlpyrjuWmiQ
	KJwIigtivyFqtm0qB+dW594mcfDJ6KBiV5fWEyUS3NjSx3xAzZcT4I/FMjr90YYgJe3tfVJf+s9
	VjimZPkM7Z/H4BSPpy2fpleDX6o018PMveNq/a1zdXY40wRybCTNrbUXxJsAG9hHu7v0COaUs//
	YUHH+FVmX/3Gu/kH5w+NhRS73t4eIknS+s9CZLmlwXtu7BOTNUJ462g9CdMTAdmbf1HMsVaKdOd
	5uAgDddcvq0kZ5xzm4R0t1/DcH3ZDWkU+uBdW0efwGCWSjsqo1baeVh8/eGxBHtZd52poMezXLq
	3Sfb1S8EbApffekR+XGeoTiJlNQcjSdV1vBvKXoB+XRwpayZ6xCk+1XdeNiy114AKFXbTfDiSK7
	ggbO2CVNIVqhzr+m/WZnSwZxREyHOO0h4SFwxJ0maW6DqhE0tzyfTTAOYU5O3aCRlRvE=
X-Received: by 2002:a5d:5888:0:b0:4a6:d298:832b with SMTP id ffacd0b85a97d-4abb6095e39mr24438734f8f.6.1795469535507;
        Mon, 23 Nov 2026 13:32:15 -0800 (PST)
Received: from [172.172.2.5] (host-188-174-207-233.customer.m-online.net. [188.174.207.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm22833466f8f.18.2026.11.23.13.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:32:15 -0800 (PST)
Message-ID: <43dba41e-092c-40f3-b92f-45c8ed063c48@gmail.com>
Date: Mon, 23 Nov 2026 22:32:13 +0100
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
Subject: Re: [PATCH net v7 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com,
 skhawaja@google.com, liuhangbin@gmail.com, stable@vger.kernel.org,
 sdf.kernel@gmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-2-xiexinet@gmail.com>
 <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 13:27, Paolo Abeni wrote:
> I don't agree with the goal of this patch. The kernel allows a very large
> number of bad configuration. Explicitly preventing one of them may
> lead to regressions and leaves the lower device in an inconsistent
> state.
> 
> Please drop this patch.
> 
> /P
> 

Thanks, understood, and I agree. The patch is still 1/4 in v10; v11
will not have it. The macvlan GRO check in v10 2/4 and the selftest
cases for the GRO policy depend on it and go as well.

The segmentation patch splits GSO input on every port, so aggregates
from a port with GRO on are still forwarded frame by frame.

Keeping GRO off on the ports is then a configuration matter. I am
working on a userspace configuration tool for HSR/PRP setups, which
can take care of settings like this one.

-- 
Xin
