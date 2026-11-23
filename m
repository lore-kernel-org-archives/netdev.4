Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444330;
	b=uthZA+8F0ulqzI48f8aoibcaJPo6+m6BVmAdUcdIbotCB0kDGKsyWxvbSS+WFION3yvc
	 47kZkSD2okpv7qlK6DEUGwyFk56hZ/f7Jo8Hdm89HWE+gl3qReygxPqmc1odin5d/iFWk
	 Htyb197Bl4KYw+PnvCXPzZr1dY4Nze4yqvvwf//4pey8lAqlSZp7cV89FLafZqFS1Ahpd
	 +ZEVo1kQKUu8aGsPOJvlHotWGCx0qypPgRXFEhymDoiaW+YMHWqiJ9E98Iom5jnzC/fTH
	 nTjzC1JO8e49hg55JgHDYcOGec6XfS6HBuspi3DdL/CwoRhGa1wMchGtaHy0CLRkhtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444330;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=RRV4jneR7YP3qXNEdGI+8K0txt5fMw08GLIDHdoV0Pcauu3CvRkLawD4iSXK+UAsPktc
	 Cpf/rBnBaoupc66vIhhjZs6cVuHqA/YVFylff4WU0ZkUMM/2e0sBb2hyot9rE5ImkrUyW
	 SSH3mUt5nVpmlZxrlhmLi/1duTdT9TCt7tP/+7RvImJ+EbyImmAf5agL/o1t2dg9m7bRj
	 OSvo8jT8m4j+qkBpEe+Kn6eybLDZsHZ6SDOZdi+ke7xVGo+kNoZitCbdegT+OVzICdhfZ
	 HGtqVfZ8o6niWJyTVlyhk7+MkJKtFG+eYm2VhciiwmUMqEJacgiDG/WIIvrJQbV/uCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LG2GPrJf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdmzuS5m;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A28606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LG2GPrJf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdmzuS5m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795444329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=LG2GPrJfVVj1HBG7vAVfePCt/UJcEN7VCs4PKSi7M7Bc2NTC5kLQbLzfX6eFQwObAoB/Gq
	0Spu2Q+yBHqlHZjDhZ5+BaSndZlj9BxEQyT7DZlLhoABwCfraFlHmajHAyhYKC5KZ8uROi
	aSDl98l04kAf/Rr6Ya/AWMLcO3xyzTs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-p8rCp4fCNDuZfZs4ZikT0g-1; Mon, 23 Nov 2026 14:32:06 +0000
X-MC-Unique: p8rCp4fCNDuZfZs4ZikT0g-1
X-Mimecast-MFC-AGG-ID: p8rCp4fCNDuZfZs4ZikT0g_1795444326
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4ab341c0696so953083f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795444325; x=1796049125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=hdmzuS5m5zvAuAe7UrPm7CEjK88HUjKO9M3bpisGc6kQjz7LY8ITZC8Ml5wPGwbiBo
         9s0JFfKU3/6I5YhEoRoYBU9UcUMuYSH/E2XjlCDqYt4Nz0ObPpxwUzuwAFAW/0eRVRFz
         IZLAAWYfTHev0vLZzXz7PRORJPEk0F9E/VYOoVuPCwg54af9T0wk83w2WpivEMVjVmqG
         blIBkRAjJRlJAewH0eEx7tGrmQOOYzZIubVmrWBr4JCyyKQbBxaGxuMcCy3nOKrzVdCz
         5+9ASiemtaZgSgGChmZjTepsX/tx6Er6H+u3mJRMr7Rpr39ksMMxafbpHJ7oVgOMfLRY
         tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444325; x=1796049125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=0RtIWYqUSUIZY3vJM/o015Wqvhp43P/ZA1Meu80jQ/Ak5Ubdhggu4F6wINGTG6bB/u
         Eqy+mZ3TjkqYBjFoFjA0dw+f/c8gLkHMW9eFK32HAlh6uBUXdl/HqOhohMR8TCXvvjaO
         bMVdc733tVrokEjyL3inJUQmKhfNQsCd04LJbAzW53LiAilQtMEh5nj3pgqV6kMb5m/8
         q3sLIU+fDMzsrCF2yUIVD2ciabUZdltnwI1zk8YVWzEaWPdKZUbVEpN5PQ8qpq71umwd
         d1WxhJFth/RkTSf4ab3qGgqjTyzpjaH0sqiM0Vmqc4exMB/bYrEEtogWlepgiATtu8/X
         zCYQ==
X-Forwarded-Encrypted: i=1; AL+hErHwwayt7GCtCnQPW8MJfi1VfjA81eolGcP/akH5isxS1MhYwj8M0TT0Z4vCyWymSOGGFDoiCMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nGxuJ1RU3y8BHLpQXzMmjjvDYI9Qzql0gUHbUurQyaaBU69ba
	0unRv1697KKbJlt3NiUi2V3BXEj/3eeJV6Nud5zcLkQXKAby0RWPOthJ9ECtRUIUZUKc+BAtyBt
	qr5Bg9KkaIIxepJiqCNikPhU/wnZXAt+SCDgnd0iDTkrPZS6RJhaa/Or5Eg==
X-Gm-Gg: AZFdTZcwjX+O9Ln4PpP53j2AfalKc3XRodWmcIZP1YSx+POLuPmZkXemNlS8M4ETg5u
	mV03Nz2D+v/VU6FKtVeRxSh6ml6nJjmht1cDw/9bHxnzNBal2OSaT51fLY0hQCM/XdnHnMabQn/
	u+g0V26VRtJyYzGGH11pQrlaNKFJtYqGo1rfB/7/7zNdUp+xbAuLBDcnQ5w21e79XB4Gl6T6BKc
	8ETBVTFpwL00p+Mq6dAV8ZWczo3XIE4GdCL/7KtAat7H0LbdflNGVRLJmGC/tErvLbIyhMmusL9
	DqwsR0P5D/sVYs2e6FWjRntXlq638aFcamXg2rtCftKuHQyAJy+0mGFbK4HsPoHfkaeqIcLZsj3
	HkSrbOhF+BQozbm2kFIRKdyngNqiwRT4K2DkogsIQQ+RU+aj2/nRiucNXFrhZctwSPahsPshgNn
	ZNczH1PaDmRmO4Zz11HPeP0YEDbZdkTGaJ9p8bpauUXvLN
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940931f8f.23.1795444325654;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940880f8f.23.1795444325262;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm23554628f8f.8.2026.11.23.06.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:32:04 -0800 (PST)
Message-ID: <b745d596-97ec-409e-9673-176dce73f6fd@redhat.com>
Date: Mon, 23 Nov 2026 15:32:03 +0100
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
Subject: Re: [PATCH net-next v2 2/3] net: pse-pd: realtek-pse-mcu: ensure MCU
 does dynamic power management
To: netdev-bot+sashiko@kernel.org, jonas@jonasjelonek.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, sander@svanheule.net, russell@personaltelco.net
References: <20261116115224.1454885-3-jonas@jonasjelonek.de>
 <179506764349.3136.14504567519359431973@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179506764349.3136.14504567519359431973@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 06:54, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-
>    core.c:854-857) now fails probe on any error from the new…
> 
The above looks like worth to be addressed.

/P

