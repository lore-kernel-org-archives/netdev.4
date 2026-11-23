Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443002;
	b=liDAeR0U7ZACeImVDXWzvANxnk7nPRDYD/Fs9tCK/QoVOHPTeJwdBfCTV5mkKcK8Ky8q
	 vQmhlalHTJugDTZuseTlowip2lSeqlEr5kJTg/AJY/n/H3VigdyLT9XR8diul+z3fbi8n
	 4jM5WZX7Emwwd7BznQX5DtGPmBctIT8oyiLQY2pdZw6xYSthWcCjPRdf49UVYfa4uHz3j
	 mFjOsaMejfGSyOLsW00Bp26ADskt4AdKUWYY9hBb9R/xlHoJmeJ4ugRv+vgwjtN04dU59
	 wOnFnDnUH6Qf/2RQNbYJZziuR3hRhkaXgcokuyAOQxdLZHmzeHZvfff+BX0tLTJWjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
	b=BoaKYMm65lLJTQFJ317oR4pkA8Cu0E2Si1uV0tc7/TFwQMsdMjscdQ22dT9SHa0r8J6L
	 Zn1fFCRYgP6cpZSfOmCHHJIq9eAVOvcWTsLl1xDEGHBwigp8IYC0IHQE4AQa5oM0nZOXH
	 4UVeX0zUKKEmpkzCM+uqy89fO8Zrx9vAZrP4KwSzDbbPycLoE/JDRuLJf/ZC//tuINtJl
	 bmmbcRqPN6O1FUevd+IWv1n1gyDPu8dlTtf+emo2xgQ1I0B1BvcSa+gSqAyc6Ndl/jsMT
	 0NKbsH/F38dsFMEEJCDlnHahwvHSatw8Fk4oBEovkeIiTLOvm/nuixWDrSsZn2Jy87Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2FF606A693
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2FF606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Paa77cZC
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so3587607a12.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795443000; x=1796047800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=Paa77cZChyyChxxqH0++ZoHrNdr+ZwfEV5r3GB0JbKAt390gQbZVBTLUQK/SdI9upz
         xGXlAKnQc/LOSJ125nn0daxggCAOvLBF68qypSE/tHYltYiQq8Ftq7d7gBBmmiTAM3A9
         iSdT2mbU+8CzXHhDDd6dqQc3SRWZNKOyny4bRIuFL7Gbac1DRYadRvefq4UjuhQ6IJOc
         NYBjw8WW4q549KfSprr7Q2nsQsODiY+WQPIb9Zc7n5aYf5+nZPXZifAFkI7OPkOSaeot
         m9b6+PCrJwa55p6340Xphnr9GVkalxKvS5OaP2qnFVst3wc999+6WwFX15JlNcWfWtKh
         5Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443000; x=1796047800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgZcTbM3Kqv6H+uxjoWsyk/LUvsEFgztRPahYNF7SRI=;
        b=FmG9ccwclCmjJp8qjdDIuSJzANtxGonQxZeCJ22/l/dH3zR3r2s951OVt27leoaa8+
         5Qt7N0Zo931BJc9JTJ3JztUgZBImucH1TfaX9TMQ1oIUDYsVf2f3TS9zZGmPBrvVPSP0
         lj8bYi8zT6X/Ay0x+hmI4brdarGfACM2hizGRjwd5NKla5kkHPt3qaKT7sWkEPJ7td3O
         xcMj0a5TdZ+ZxffVzJiG/uZdPwsHqYKtoV+y0boxDYKQFNImbugc4/QiajbGrGeeXibJ
         YkDI1cETcLWdwoC+T8N5zY+D0d7b4vwV2YIlyE3Kxkb3SJSq4aoB6eQ+a++0by/gdkQZ
         vnUg==
X-Forwarded-Encrypted: i=1; AL+hErGeiSCJNYVS1ktcq5iOGUdx7p4Zv4ocIUqU4OLkcUPE1suemSDXq88gPTa9r1DiQIYRBhG7Odw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XHWm+QXFWC/phCFj8MUk6cvFf+j0xbsXmxHM9cOnvQ2EvTX9d
	Tcs05ES+x02XCy+TerPS85gvmoJvnWX5Bmz+z/m3qUa2U0vsY0j5qMiRNyI2KMmcLck=
X-Gm-Gg: AZFdTZdvieE82ZWxWWuewdlv/fjHuOybYVMOF9z0dhbgrbJ2bx3GsvpVciWRrIW1zEK
	bttKGd+8obckvSLNtyBWrXiFh51X5E4qrwr/yJgoM7ekfH4dvdKKxB8xXNGzgI1JTsf482vrtng
	y3E5NRLohVL65RDrYnX+B7saNdquJ4RGKqzBdrvuVXtafpmrFKZxLQmbojwUmmYh4ELY6podMib
	54972qoFC4SMwrwcULzP3Q4CuPF+a7jZEO1Bz82eM2SwM+v/4y8VlwLTil3IV9F7CkF7BwtCpLt
	P1cTH+YFQ9r+AsMoZ+wXG4Ml7ZBEo4wkywevsJDjtcLX8ji32KxXTei6nvln5OXWw+I2bt6P08d
	pnPZ0lp6+O8xOaPPhnanZhlyq+a86v9MaHiSXQFGsJz1+qFPstAXsza6+RDGlPYxd5dkMQnFbtR
	2L33imcY7vkXhWXxqMIIVF5MKzsnpJ0mMSzNIBNBKdPQTL9URTKGkHUwgLaKc7UX2ZCKf7JZvkh
	ekknXr1UHfDu1Pg7lYdGmpBiDuGg+UYKxK9pQwTtvp3QhF70wNNeamGOKR65fsLoTyXT+eF7hyy
	SVkXyx663QS3CUzdYWtaqRYT7DFt1QAd+271dPo+IgXepLw=
X-Received: by 2002:a05:6402:1953:b0:6ba:ad05:3fec with SMTP id 4fb4d7f45d1cf-6baad054b87mr2592953a12.29.1795442999662;
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5388027a12.23.2026.11.23.06.09.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:09:59 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: hangbin.liu@linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 23 Nov 2026 14:09:47 +0000
Message-ID: <20261123140946.13992-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121182217.4609-4-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com> <20261121182217.4609-4-emmaonana18@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Sat, 21 Nov 2026 19:22:17 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Three more checks in veth.sh print "fail - set operation successful
> ?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
> "bad setting: reducing RX nr below peer TX with XDP set", and "bad
> setting: increasing peer TX nr above RX with XDP set". A kernel that
> wrongly accepts any of these invalid operations would be reported yet
> the script would still exit 0. Wrap each fail branch so it sets ret=1.

If you squash this patch with patch 2, feel free to keep my tag on
the result.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
