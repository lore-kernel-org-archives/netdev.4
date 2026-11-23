Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445919;
	b=A/n4eJklhtR/Zn9T16zFlD05ItKxL52PCPs/d/5xG5rr//y+jKJ1a1DDJpVtx9dNwDCW
	 LfzVwjq4q9KNxM6XlZ7ByRyFaTrHgpG4cYZDN4ph8QauqXcToaJVASc/UcHlpgkjGCzQg
	 z22EU3+86BCrahjTNh+rog8EyzjRyi3vW7adVKcbuDYI8hlRkvC7hQhg4k3nZv7uv8mAc
	 5k5hnRI56gVwhpzxgy4BRBOFAaDU4OzlNk2EfMPxqlY0R62Qj2O4z1ozEKOAbOq8uxg7+
	 80GgC67oiA0gZxnCdeQlsuF8QSnYPSQBUfyRaNnRpaxVu3BqRtUrUUm/sFkSlsoK57g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445919;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
	b=5ghLQcR8deIyMXb1xn4HkIsmI8g4+n+fTnYaE7cAQoI81rJ3AMZAxDHrZAATpFbsyQIx
	 4l6EK3+JnAWkzljrgylOrXIJfC9THVtn8RrvvvAuIFmWdMeWUoAAEiJGjRJ1oAHfwx8Du
	 v7sxvcV0QBeKh6bUH7yLlsnvH/IBISbwQWokWkyn/9AWnNDUNUzvhXzRodrN90VU5EQd5
	 XQsvPoVLydMt/yLjwuopzlWyMcvGxXQ/i88Xdp80kaURaKGs+xoZCGEwHO+5he6m2fj2F
	 OR8GbwsasnFvzKbquBhT8/klvt9BYrlb9EYrJyhuhdeH7FnTjqRgXpzLf2drKrc2nHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="KsD/AKDF";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KjDUAUH1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD6606A680
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DD6606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KsD/AKDF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KjDUAUH1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795445918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
	b=KsD/AKDFiIvmjZ0K4r0aWoM5k/049Hyh7Xx8EfDGcL8VKnyVHAjIh+jO2eC8kPP3Y4wcVN
	cAFAr5In6rW5tmfn51SQSvNrBAF9DrY8UosizMcqujhducL+t3bnUln5M1ulphE+YZS9T7
	xJVFlKDjA5s/NUXrLrTFan+wMqZBE2E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-9EOWZzJnN8StkBq3js2hUg-1; Mon, 23 Nov 2026 14:58:33 +0000
X-MC-Unique: 9EOWZzJnN8StkBq3js2hUg-1
X-Mimecast-MFC-AGG-ID: 9EOWZzJnN8StkBq3js2hUg_1795445913
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so1597494f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795445912; x=1796050712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
        b=KjDUAUH1sQL97Dh854z7bDsO68b6r8/Eampx42bqxq06Dp8S51QX78pwwZXXb6RipR
         Vzx1WokHUO+bS8XPKTcDoArLe5mFy8hQFb90KoxDguhfiOkAxqEVhFPkFDTz00s3nzU1
         1c0Gs1Ddj6GCBHFhuMz2xDL4qxV26hMdYIcTpn//D58dBa+JSkeWE7XPEy8QycgWZ5uF
         sg6UrtIILsilR1mWW8u7EISnzuHvTRUUpIEYmyeuyeNi+MkVhpRkof51qiq85KdKAIzQ
         +x052aXjFGdJ5/BiJ1Q3NSg5PPorPTerFBV/jLrIKcJf0Oq6Coie7wGHWHknHQDQfSPC
         TvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445912; x=1796050712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
        b=Xf0qYm+3Bkln/UbyewI8O7qCnB+0t0YB9Os3BqzJlbK724D3pBSXNTKFSLqOfjR7Mb
         iRSkT3MOXVsoCdTH6tGUQ2ID2dqcL9S+09VscMdw5OSqamj/9pzrvuPLoh0a+992nZjD
         eoudqfRR6GVwL1ZmE0VP16qzxf9dljlzfbBUvtwT5yJNvM2+Bkrc+Gqy4XF4VqwNcDbD
         ZVQHetgTyyPvyP/rUmxWHSoggXUn6XzwRDE4egBGBEdytkzfC20qxNXTgt2w1fQEP7M5
         rZzwLdc/okUKwSS+9FSL4MnTuuxK8Yd+TnrxXC5Bo8xm3Y37ciyqr1AQdaAhhQTTekxc
         c6Tw==
X-Gm-Message-State: APuU4Z8FdUv6lKE8O7+rSUmVpZHbIZ2WpdH08lGfjj28ZOyv6Pe4UMCN
	O2ui3LqDWwyH5nEnsrcZTE1gJIponorBkuaYu3uLdLpf7jb4sVNb550AqTVMJG4cWcluHpHmfbm
	Y5XLgUkZ4gKKWTiPHf/7ZkYyWCBQXftLSbaguViS00BU73iUMD30wpu15dA==
X-Gm-Gg: AZFdTZdlC6PRmmh/NHi6l9LRl7ylGbTNT2dWWBkAcNAnCcdGGQi8NPliRHUIhQnmDmo
	TEygmjdzqWZYeXOaXDvruwC1DUaBADmopI0r/UB/f2oEGtM1XISONsoZbt4TfTskwMbr5H0Tz5s
	zGnpfbR4Ob/o42GfzGRUSjmZ1mYE+5hyJuQ5mK07e+j5/SmLQZ6SKBzC1glsrPOog4m3RoFcNRt
	flpfWyjUyfgaDZwIFxPUIowOWLAwRE+PwkSkTk4QYJJCOSggke97o9pa3jioOG6npif9/YHDmf2
	rs22MtT/JD8SABTIS6gADWniJl5ZaLpyojJprmBHVBF4D/SLxJh2rA3j0YgwELmFbE4dLWIWvvM
	htmxssPc4EAQDr5LP2iKV8xK7gSyHf0140zJ01CVM931gASFtz8kpdSNGKCWM3Cldw0alhqoUmm
	PHTGszmPD42Gw4feAYKuRL8Em2KxAvQ+sF8O0FvSq83fv/
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098505e9.32.1795445912692;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098035e9.32.1795445912294;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23206193f8f.54.2026.11.23.06.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:58:31 -0800 (PST)
Message-ID: <15ef5667-23d6-4c8d-8cb9-ac3853677c81@redhat.com>
Date: Mon, 23 Nov 2026 15:58:30 +0100
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
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port count
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 10:46, Haoran Wang wrote:
> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>      sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
> the same bounds check but fails probe with -EINVAL; skipping here keeps
> the remaining valid ports working.  The bound is the per-chip port count
> from the match data (sparx5->data->consts->n_ports), so lan969x, which
> shares this probe path and has only 30 ports, is bounded correctly as
> well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
For future memory: please send new revisions in new threads.

Thanks,

Paolo

