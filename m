Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367913;
	b=5jNMqTDxIhXH2vRcC8SK+2ntTfHX0zofOuTwKsbasSMGQ5s+zTalTs/NuONU8Lhhwb0r
	 sjoKe4GHqRUGZ/f29KMiy3INPz7HPcy5wHhh7jVaIM2s5PhPa6KUOl0+Nn4w9LnsHA+K5
	 xNiGO7PMVc/2qJzOfsWS0h9d77gxikMLX1xZvh07ZTFhlLXVnKtlw69qWmlzbbiZ37Bsr
	 SdYV8YCiLl51Daz6m6DJHBcQUnLkwGAaPPN12g+wuhk1p9Z17rPNMxY8Yws1HAxh6iypF
	 ejaqSYanwsHE7Xh/0Jm7XbvXwx4GfXMBlYa9bkq9LcGcCQKtVZC1nWyhD+ZeAs5QCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
	b=4GeQu1d25eI5kgzNrctbLio2my9jwSdOZwOnQJO3fNFJUGSPsFMROQzaDvSOy7Uyk8du
	 aGkGthUTKkQ20XEFe9LOk9nhmkC4fmnEZ9jT8yz++steL/ojBvRhK6PYtOMHnQqnDjoff
	 8HrzDX3h3/YPi5v9Fbk8KRjirV7+jxvyAHSXCWLYNvLzLP8+sqDo+0ZVPBqDCPTppPtte
	 rbnZGgKNZHjnNagQxMY0i9iPBqibR44lhMRgQXkjm05SYAcyGF8ORWxCeUZnHEk3bqicu
	 DCLl7Naz0ifD81rbE9kK15H2y0xysf2HOD+UojTSDtGHHPqdnyPbYkb3F6LTV+3JI4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MSEwHngh;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAE606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDAE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MSEwHngh
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0426a65e0so15845455ad.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795367912; x=1795972712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
        b=MSEwHnghHFpvG/H9NvyBLNcSG8oKpaTq8hFGjcbk45OKxp7HM52R6ckrAw/Q/A7gGx
         xHgWbgp6sLH23mTJmJwkBVHRXwgTJV95FigsUnpApXdZaqauZJfdZGt2cDkc3zpquCw+
         bE74Mp/xYKn5jeOU0Os9Bx4CmTm2Az6CLgl915HHUkDpUpTPESCFkKVKLLU24bi29sr4
         gnVxtBpSKoN8zR9F4EUzHSYofP3ITSLuXKPHFztugHXkr6sQe4jVhtxC19Pqpg2D87y9
         XPrlZwJafq+RfLxT1uWctWAvNka/48LMeP/QkJVXiqK/sY3z+bJiSh05GF3CuxEhtayN
         xC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367912; x=1795972712;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78iLp+ukyIH3Bqo6jdwjTQqg9ybQFd9VxizK2IPYkLQ=;
        b=Ukl6PjqkwKTnjwCtYNwVBnRrvoWRck3DHiW53yMb7Mp/s1bGI6vkMljD5cJb8L+Shz
         uYcaAjUagU0w9R79tBMA7u56kCK3aObJH/H9eRK6Y8FaOLO5UpsfCgE+kdr9MKeMp4Lq
         hGkHVJE1qtIncDW3dpryLf5Bna4vnSnI3R012OpnIGVyEbRmuDiiN5rONd8VbrFTL9xF
         OoceDz56t/5d4UhMoIgeRO/oYk/ELMCQJFioXEtyrnyYr5F3xZUt6SywP0TLJSf/1FwU
         bQoR8cyA6l9f0eyzBThp2LEWYWIve/PSX2SFLZf78dQy5k/uksxkprJ0+czTlq+U3A5A
         FwXw==
X-Forwarded-Encrypted: i=1; AL+hErG7SnCWmaOP5JZdb9iwziqQFZ0lhy3GnsyA3peeVPJ7Rij9R9YLoRCIaPcFdbaFUB3aVU4b1rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XVYrV0IP8Fx5h6ItCdYh+fj1wwk5wQ98wngZ79QFGvIagQjn8
	DblG9HMCZ0vS5w3mxbDcuxampEfoButRSer/Y6yFqN3r4LB3ydH9G4AFnBkQ4ldiG9o=
X-Gm-Gg: AZFdTZfxxpTjbr+CH/koaomCsbIjrazYo6SUasaisCxx4u3rHJy1M8uabuIrYPdfrs8
	7UXGZW2riVguBqRwPsLpF+HX8UGBeL9DJKdI8/qWZD5MkuHzRJKhufXig4SU37+PRVBEM6R7B4d
	mbLpNBRdG+Tr4qaONRDlps3j7O2JtUgDK+5qrQtuhdRFXfpZUWiDUfTdvMOrYHwq21lG2y+Zs68
	aDuidCp0jOH/1ZzegSPsyPXUlEPdy7C2mE1ysBfnyXLwBOxYZduvIdVJT2ryQrz4Sv0LsrOf+yO
	0q+MvNAVBEvEKc4OmIx9n8SfIt0hMiGv2oW+VCo91zj3AB0LBtn2Q45bRBbOcEaIJFZY2oZwgn+
	1yVWVeRPixdEwBN9VxaNwqjNztQ1xgxKe0gndB6SADFtruPVzO1eTfZrI6D9QjKvP2TA40GRBbY
	Om2gmm3JDFW9SeoI8FFnejfNsa4OoKQdf6gwkVYWlcGHXsg11HsDTyAge4Wtz53QkUVWM+YcsvD
	Vu/LFMrLoLvTzpL8odsIDKYsUD9Ed/rHZXL6Ir8NA8nX8dnGWnmv+LjGXM8Cm1YR7HfWfG0GLA2
	bIB78TSnr7kZhWKF969WRFfXnJplWV9gSkFjhoL/DfEiJKb/Ug4YkrgdS7091UEooxi39UE=
X-Received: by 2002:a17:902:f603:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2f03f2760efmr88354605ad.74.1795367912601;
        Sun, 22 Nov 2026 09:18:32 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm40712525ad.5.2026.11.22.09.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:18:32 -0800 (PST)
Date: Sun, 22 Nov 2026 09:18:30 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: YanXin Li via B4 Relay <devnull+fadouse.pm.me@kernel.org>
Cc: fadouse@pm.me, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko
 <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net/sched: act_ife: return -EAGAIN after
 dropping rtnl_lock in load_metaops_and_vet()
Message-ID: <20261122091830.3266fcd0@phoenix.local>
In-Reply-To: <20261122-b4-02-act-ife-rtnl-uaf-v2-102eba468698-v2-1-67c413c45928@pm.me>
References: <20261122-b4-02-act-ife-rtnl-uaf-v2-102eba468698-v2-1-67c413c45928@pm.me>
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

On Sun, 22 Nov 2026 20:45:52 +0800
YanXin Li via B4 Relay <devnull+fadouse.pm.me@kernel.org> wrote:

> +		if (ops && rtnl_held) {
> +			/* We dropped the RTNL mutex in order to perform the
> +			 * module load. Tell the caller to replay the request
> +			 * under a fresh RTNL critical section.
> +			 */

I prefer that comments stay in "short and sweet" style.
AI and new developers seem to like long comments.
This comment has the classic /* add one to i */ style...
In other words the comment doesn't tell human more than is already
obvious from the code.
