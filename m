Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690308;
	b=VhHCuxhY2bL8LK65N0fMQCP2s4ji/jPtSvKtKzloce3a2whHhE4hez87nhUkDBS7noKN
	 bqyX9f9/fKNXnZEBHQIYCV5SyldjfLnLqtEIhVxGIZEkf9eOX2X473WTHlgBl0uytIJSm
	 Y+opKrvvsIx+L9FaXpskgbmE6yx+FeRIImwTwO/+VoKFIjcbuUUMSljPqVj8pSGmji/fo
	 9JL/XWWm+f0SvwEMBrCkWaV3BmeOypC32GMFZ+fEiM+mAFgGI02ZPezTQxY4POv6Lbm17
	 m0AkDADe+IR7kDZTGiXxVtCGgdrRBDLzph71CS1Urb49tRwdetwu50kCRVGqrDOiPEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
	b=pO/0ZQDDLxSmAUt/eM8rrIRKlQgZVsZcY6epVzACIAmDq/7CS8V+aMv2n47EkpEF+4tE
	 snJuxroAqKl09JvJujK3XNJVP8l8g4bI8G96ExmR8t9quLW5hlcr3VgyLFCvcuA67bwi/
	 QWhbzGQ7w1msTCEvE0nXonJ/6sSJ6mOdIXFCDEZQvNRb2azVmWRS2Ax20WVyN75Tg3uc2
	 HEtRZXWLM9gROsTArDuovTyXb+2Thrgb2rbDORrYZsyUAWFan2XwxAv9rQ34GwLOhTiiJ
	 B/0OhLNIHXMLXC3QavvMHyDomtIsiUYuCFR++SOM5IQA0p+jUtQlayGUPwJ12AWa4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097C606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9097C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2858259a12.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690307; x=1795295107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=Fb5v+9t5HQpH99lBDL6eSyXCd561d6T4RIG3tul3obk+hV+lLvqwx2E/a53VBrruzj
         C7QdCNRUNH/J3utrvpe2c/geGqZ5Sl8S8ROXMNSnD6HIxac1Ng+Ry9w9h6KKx9WqPGRk
         nL5/soLI9m/NrOZQjEKC8IeWYL9z0hSTP62ueEx8glDPxYjodiB5UKN/us3YZ/pjLuiy
         jR7DawCFm/DODgpczCGYTo42aYB6PExJBlNnAUTnFQ1VK90sXBu/fB3nC7A4lv4SEGbL
         FCfXgTsCZXAhHYy7HOtrxslAD9W2+jbfWDGJdsvIuv9xo7so5tZou4C9uFbhXQelwj4a
         ryLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690307; x=1795295107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=iWZc6cqW++QY6SbeHFYlnBITx5M6HVEK5nWsUQZ2dFeHhJluh9trUuZ7O0ma+KRBa5
         BH5bGeJt0/v00FbEJsl8ANMdvOPRVhREWXJqCVKyYeq7T3Szi/UUz1p7CHFwb5dZON4h
         XeHxGL/SnbJI8KvVAkIIXOgLt3ZaXh6ZHcKSvWBaNuEekGLDFoxsKbew5BhFLt9yi+f7
         58B+Zs/NmwqBB94ubaPYP2q8qiMYoOV6KwRbsd+keM8zV7mtbhONn4k5gMkGMcRBmyh8
         fW8ZZQ/uEQh0pMJanHFSeQ41zHsWxPDEGYQTXv17RBn7xKX5tdu4sIvaZDF3mCJvROax
         zKXg==
X-Gm-Message-State: APuU4Z+OB368VWP9M6Cr4hy+ZB6lPHjisWo7WayFpfMwfVViKiwcRkz7
	gReHhIi9V4bMzk/2J/kYOuqQu47XZSY3ZbKgTLvEx7M+BTZsqPIfXvDpUXpW3ojU4w==
X-Gm-Gg: AYBFou1z4yofBkveqi0knXxHsKUidJqV4VZrOcM/9KIPTR00YQI/WzRVjRzVNqr4EP3
	uqsbYaeab42Io52kDhV1Zw8bjpEhNw8PWOHu/3e2m86YyBMtLum0BNHab0Ta3rFjJaNck8eLOR6
	8jXloP5QRPYsMzN/Yl3EwCxIaS0duOMlWnHYMNLqXCECoSEemSvK+U5uyvoz8ZjCp+pV+5hE8I6
	0GGm+Dka6oWUBWyThjANCwK6uas56IElstCiQV+xVbJsPBU+00QFd+tploxy1tWddymcT+jPr7D
	1FEdTwqvN/kfczQHJKOGv6PM6g55YCugg4Yv+t1bOKv0/6HAITNX+k2+7TT0bj5b/9t8xJF6WsV
	L3uwUKKTvfZguQD9izg3EEVRSSllNUJlQ/Gpx4wrwXzQIWsEq0s/Bhn1q9oOQ3GtgkGusbXTf6f
	wfBjo1w/7IBxz7mViu/MerpXaJMpDZ18C69v40KXQxxAccEU3dslUpzuUMHMAe1lKIQYy/m5x3x
	AuwkqaNkInQJQLlTavZEgmiXzotSBzlzBj0B5JIvqavbUiKW6Mp0I4jMImdQEjBBky8HJG9vwo0
	QCf2nFZh83/Yy4ZaS5PnT3AE9d/MJI6ujT2KFgfJC+8grCD8XW0GCflZ7eG2Z6pdgNS6r4mbW3t
	PZNLc9cUBKV2s8pBLXHlaAtjtJRfdaccXhudbe9YXGZ+iDAa/VjH1ZhKfgFG6T+u1niigYcyFDD
	IlBIzZywCL6l2wUR9gHczai4C/YsBKAyzBU8ggC7NPFu580zh6GcSOt3ILMF4V5AFgiA030OmyA
	4/AADqX0eA0I8HeN8B5vIOM3NL3iSGobBwfkb7Oi4dAUNpYNlNKYNRzQUftlH7ceimqNLEKH03D
	aqMhml+/sSlhoq3kH7RryMr5
X-Received: by 2002:a05:6402:42c7:b0:6b7:eda4:e136 with SMTP id 4fb4d7f45d1cf-6b7eda4e281mr1321653a12.41.1794690306618;
        Sat, 14 Nov 2026 13:05:06 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361280sm2705836a12.10.2026.11.14.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 22:05:02 +0100
Message-ID: <20261114210502.787195-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179468119953.2168702.10813567320493574993@kernel.org>
References: <cover.1794139176.git.julius@bairaktaris.de> <179468119953.2168702.10813567320493574993@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 14 Nov 2026 18:33:19 +0000, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Reported by the hosted Sashiko AI review of v2 2/3 of my "ipmr: forward
GSO multicast packets" series:
https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/
I then reproduced it with the selftest in patch 2: on net, 6 of its 18
cases fail in 2 of 2 runs.

Julius
