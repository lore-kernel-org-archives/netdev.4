Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568012;
	b=TFHO2QA7e0FaxPDzpaObDQNKP9h75AKdoIchqnONwRSK0RFGbkIsltso9SQPUcVn5jSi
	 v2nBnK5VjNl9L2ndJRkDhI9q9m9yQKo/8JNMw4EJ4G5nttI2ppSOYoRg4IGvyVUaK239T
	 KhaoICQCSRPBXkLOhbh0sSYwh4C4Bbu6EW0n/EEgBCvBIYoTANqWGVq4hSYYFPl8YL8+P
	 +vCGmk4g97iIYKQjQ6mfMTIzlIiUdQE0cg1cBMzVLFnRG6dPu+1GstgkIbxQOfaYh+CFW
	 CyG7EQRUrWcINNpYH6y+fFXxzlq2rMqXUk5nW4SvQOpdJBf4e4RhBtuxyzGOX7Pw8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=C9L3/qmefyNF+dmtfadZnQgVQWDRnG6UUXa2uqmxZcY=;
	b=yy5TF6IORh/7q6dxILkyF+chW8lFyg711W84sHqHWSXwmhL7+R5ByVQ0jYs0DM3HmTG4
	 riFBxWa1kl4FAxggwmpJaUol613rdTmtH3+nNGJDnMS3YWRmnbhs2Hh7kt430VuQ4WTGR
	 zgNC4MFnXFgaT/hPQGcr9G+JohsvWgDMV55HkN9TdjPtSTBX/z5KAf+HPE4mEyfvnOs6e
	 bFz3psKEREt8br4aaNVY7kN3eeWnSSu8Klu6teLbizz8dMSQzzaYfOlz+nCMrTMmq1cGr
	 ia/+KUATlWgsxpCTqJZXB3I6/PiPE9OvcLib++X9T+U/cTcsSL3yf472cqgDm8APTJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qzszEMFP;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95F9606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qzszEMFP
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd69954c755so3673199a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795568011; x=1796172811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9L3/qmefyNF+dmtfadZnQgVQWDRnG6UUXa2uqmxZcY=;
        b=qzszEMFP0hGGBXqvIiicJ4IHvmZhepykurANq9+mEqCLl6OeV93ZUALNPKLJhWAMiE
         BL1EFoai42QP+4TQtgkdh2TI7sfCceKJRao/LNPsIucAwPkzqK6qjn55mhqt6q1YkrxF
         +b6G3OtYAEbSC8B8vMFDJV4Qophk3c9DEPlt/bhqk/Czh5MfiXBrhBlYjg52xE9HZq8K
         qbXmO/2XGb3mVnBuQKu4EdUz7jMV2AxFGFWtA1XoC1R4oxOxT/636E1ZrDdFa9FtZSjq
         nBqOp1Lfrtjz03taqHePSQBh97XaWiTqzto3Wry8o0K4mopAYV9MiGh+QAsOTVhU9rT6
         HJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795568011; x=1796172811;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9L3/qmefyNF+dmtfadZnQgVQWDRnG6UUXa2uqmxZcY=;
        b=OweLYhODgKa2X0JRcgF/eZbtI4GKRUyeY/CdfHv0fNr4ESLN2GtHNNzJiE2WBxlaKs
         iK5e1lyapEi+X2RHqIpFzBeSqG2eBu/c+MLJfzO1W56BSJfo/NTDpa6b4bL2KLRrAQ/G
         P+znNjyWdZJcaAhWDbL1l/R6mHm0QoLHVvasaeib4mJV97GgTeuogGqVfQjXdtvzY+w5
         AJK//rAooseJuQB99dfNUhckAxgZQ2Qb8xIr6bR7J4P73E+KY6uWHpeydAFKuOpmEO8r
         E69m8jkfWsTMBWWEuzZt8Ob9KbqYtsMA58D3FxACatFiOSpAX1+AjCOR16Ja3W/uvL4w
         Yypw==
X-Gm-Message-State: APuU4Z+xJXZi18ZjdVEswIgnukZWFm3y6qJ522CwDaKgAPJT6Ty37CrX
	EvrtyXkCj99eVR1MVJyAKuk+zcZEQWKwaNsWNEo6KxtkFjiF3PjFTUnvwdkXFMXX+Ko=
X-Gm-Gg: AZFdTZe/10UtGmDghOgEYZjHl+sxx/HFiZTIY8Ylyq+1olCy77UOtIn0n2s2ncNxjLx
	XiZquBtUI7pUyC9QRmctRnVhO5lRXMsCRV5DazglU93UAMRVvhegzr6QF6MVuJsYoq4pgc2LSkp
	4FUAZAxTX9upAx2m2VpIxZOOr1BC9v4Z4zVlrPPLe5VEb2iMJKVLcJLnfpwpIo2qvC06tHiXd1Q
	l+iLYsxtevXXn3jqdV/tJKh8gDJYQAOTO+b08jL5CxjiZ2iPoChs4cSi1x14rqi1Q9Mtn1rwxRq
	8A772yFwAFePFya8R/z5M910hRWHJuTAX+OtYQb8wQ+8kwIEyvvcbmfd0chNvIf8FZxmu3kq4OZ
	1WXBhLrzD9kXJfTKsD7yVqsrfMnwYzRV4+a446ldvqnTJqn/x9HIgmw74kHTqNsgJvyR63jYgdG
	i1GG3cM2CL389hmyuMo+lY2Kd1YIIw0t35b70JLL100/Jvqy+aheY3fOGyPraDkieSAGAenhK4c
	l9nyqFL9uzm4ul73TVvNBEKp367M5sk9ybz49r5x2MMgCkIuwtDQwiZ5mhyGBgVXZNCCSLGz+Su
	q3IofAnQuFILqg7kNcfDtnc8X6enZpqYW8Ixbs2yjOpX3DT8CrIh27le1yfju0B0ww8V2qo=
X-Received: by 2002:a05:6a20:4303:b0:3e1:379d:f953 with SMTP id adf61e73a8af0-4014ca45151mr17068834637.57.1795568011287;
        Tue, 24 Nov 2026 16:53:31 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm7945202b3a.56.2026.11.24.16.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:53:31 -0800 (PST)
Date: Tue, 24 Nov 2026 16:53:29 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Dave Seddon <dave.seddon.ca@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH iproute2] ip xfrm: copy only the mark payload in
 deleteall
Message-ID: <20261124165329.4dc7e4e7@phoenix.local>
In-Reply-To: <20261124060139.3393511-1-dave.seddon.ca@gmail.com>
References: <20261124060139.3393511-1-dave.seddon.ca@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 22:01:39 -0800
Dave Seddon <dave.seddon.ca@gmail.com> wrote:

> diff --git a/ip/xfrm_policy.c b/ip/xfrm_policy.c
> index 5261a292..1a41f2a9 100644
> --- a/ip/xfrm_policy.c
> +++ b/ip/xfrm_policy.c
> @@ -783,7 +783,7 @@ static int xfrm_policy_keep(struct nlmsghdr *n, void *arg)
>  
>  	if (tb[XFRMA_MARK]) {
>  		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
> -				(void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRMA_MARK]->rta_len);
> +				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));

Why the cast to void * here?  RTA_DATA() already is macro that returns void *
and if it was a similar pointer (like char *) then C would do implicit conversion.
