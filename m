Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795142810;
	b=mo3wIMTcFLg0VbpYKaxfz828EXTweuyIdCkCGaMKBhB6QRVvyPMaHx0PSOWMVkq7MaHG
	 nx549z8b3R3iDU4QRq2oT93rFZ0rSonqqknRkGz3LFVjWpkJLS98Mr5SfIPzfmZQvBJzW
	 asKouLmzC6K1aXYoIjC0GPUhvCk+F3rtMElEdkPE1TuVojFZKufmo/pEqC6arfOaZ7oxn
	 rqWXdARFxQtAC2aB563Jk/hmhe8XwdQnzM49yWXt8piCgMsps+I6cCQOB0M4+evAbx8i6
	 LQoB+7fl8xdq5uMLaX9GCS1CmvhE6slD6McEdOESv6BMeDaEooJS6kbqsznDshF5wlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
	b=zEwTyM8/lRm2Ep4ILqRWfzNVzmXK/2yYqZaQ7ItnTmgsQHBNxKttssdmQfd47NwkUlT3
	 gEo1BykOIWfJwxxXiuZ8ImHIcUBBtOqcu2/U/iFsEskb3AA/XaMgkCTtZHmEGDnDCbIrN
	 chffCGjxrKm7Rk0PKtfqOaYJI4I55n+C+vfgvLmyRUyKNtpnlmNevmhQvSKn0ptpMNmhD
	 lRxXlTzsO3bZbc/Q1HZBjRcmK4s3xNjJracvJ/fD7jD4ccl2moe0Ig3o7CqzIm6WfjLlH
	 7RHOZ1/NpmxD0W8Zwe1+eTGEmn21qR2FcxHFptJYHTVQydMP9xeVDAJCfV5PIPu0QkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqvGS8N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4C606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB4C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEqvGS8N
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so536192c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795142809; cv=none;
        d=google.com; s=arc-20260327;
        b=griBMpAJ5uIVNwMKO/u1TY2bVvWtnLKWUjUf4pI5YoDfj+yUtfExfrBEp/ASv0Dkyq
         q1o3ZMGKopM6YgRd8+P44VK3S9vLd5u2pQnHRlkKvsL9wLfHZ2et7hdBDDiBtY2JSFkP
         jZmbpX8rvPanrUtsOuvZsa6hykeyxF/sMqRMTKSU64GCoAqv1BFDkFIxB1/fdU/F8f4r
         BGBf1jxr/vLEuFLXBmE/S8tsgPp4uvgtyxryKMv0vlAAjolarO5XgQRczKHcBh3SeFd8
         kp2ZqOzm6CzyyrYDp9XP0kYxR9Ap+dLF6Hoin4BDqVJ8lqtTRu3k0Ymjr4OZSwQrj22x
         isMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        fh=bF/e8lofoMxRImVnGwCof5MQ1VsCqY0sgFRxBeI86sU=;
        b=c2uRnB5G2z66udoyrsFeVRf254AnwOiirymeQivwjuNlGtBia0Zwmnb2IYSJiJeLJO
         f0bpKaNsVblvv3HHHo0rtyszxq/t0q4FDbrf8tZke/6mZiv98CDnTgLQ6NPI7Zhe2wvI
         oPvPdfmc+e5/2D+HPX6IQ2oGHoGWJeXxwVYkex9RMHNHnwlm8HTmMQFtvT+1nsCbdh3+
         ttOI5fk8FNMd/+cE1jXy+G3FW/QnMGP5OeUNCGudft/njRqBaq4yCd8OBcC+VGhG7jec
         Iz2Yp/4to+2XA0HRpB+22nZdzRMVnJnDu5JC5X+zFON60yeRBpD78BGOG0zjut3rZGli
         hPLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795142809; x=1795747609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        b=eEqvGS8NSjDv/lk1dVAeRWGEh8TiPEgsovxYo2LanZz/ysbPTA0KZq1Irb7hcRkPPH
         dZSKM5hJ+MP81SnZ+0YwGi9bkP1Nj4+OFZ0Lt6OVh0NqD+8zwd2jHvx8mYlUazKKsh1m
         HPrp5gdyujUqmXeYT/G/nBelGP45z8ik/RKgIuPi3Zckw5IrXLdeVO03dmF0pTH2nmhS
         hsnbTKRCYVDZ/qt55BKdfe/Wx9Yu584hJ9b2q2mT6yR/WDdR/Qx4DXrvOm1j343IutY4
         Y47ubAtcOvI/QjaVZ/IOKNUxRBxkEueTGnwBZYTX/g37Y+CT7SGJLGI1cLuhEF7b8+Eq
         NeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142809; x=1795747609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yr/uKPUgfAaxf6T6HbuD487OUhPehvlRV062kb2O/9g=;
        b=oFCe2N6J3qxzZ9gF73Or1dG2qdOpRP52vvgpVFmcQgAUJkwSYlLwrXXuyR8Wy6l5qh
         ntkmT3LsXqOncL2GYZ2cwYYTjSrGbHpxFri1aQb8SNPSnBM/GHY3eKuLPKVq+FVwQpVV
         vCe/lmQcNzYbwPX54lgcrMgrwMa58i/935P/X5eqVP3TW5A0/OKwsKyipDTrB5E2MhFd
         0NvQtZkqJCKLZak0oFGSCY6km5iAd8E2l2Raxf3Ig4A22Aamx5Y6Qvfp7HQMWe/rf5cP
         8E+S8ySGptouTS7bgbrk6myHRJPCTfa0hf6+M1s5/Ui4/96twhgvy628FN5k9Iasc1p5
         TaHw==
X-Forwarded-Encrypted: i=1; AL+hErFVCYkq4Q+XaMSMMMVoV+Uf7WqycxwwKczA6IhS9CSydiUErl+nXreXwh5NC8yRpwX4rX60fQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D7uPHlhq6izj+ZJPOkxeQtMBsmEK0qKNeFJ8jNjxGFxBhO+0V
	4LLXe/8Y94sFaSCW5KMeO/y13j8avsqk1IKwpU8/lZiRz7hrhI/Oi7SVX1sp5aK2w6SJ8ZAI091
	aGNJWMMy/fh9qFIPae+W6FFBYxJVeyD0=
X-Gm-Gg: AZFdTZfDn837oUfvqZFiwaBeECVSt8g4U9Ww57oH1e617vXQiRmgbc8AEkxMpS7NXxd
	uxJT1rbAZY+nhVS7WMPNXg9oBjItOyLuGqieljOBJSsAVYysr23g5qOFPOGEpXGB6EtuTs9ouX8
	vFWAoljF+GMj//kIg1eSJvwQ2J+UPnt+5S2bmbCgEUuhL2jVksYzxsQPtE8xif7nJmfRRE2wvm/
	ELayMWec9eOkNGKfquXOYyztBTcj73ChO/oUk8NjME+5HTsUIz1TDzUE9iwuW4uWG+YDPXChrL6
	EGerjO7Vc+rOyYbDj82hThllJ1wYul2I9F5i+HfNPji0LHvM2DXJxGWiqfahGBOSI7JYLDRnMaX
	efmW1q1tB196Y/MKSF2WRqzPGQxTZpdakfYENasTo6A0PzaBfTjZqEITU9t7knOFCOiOL052wKw
	eeg5b2GYLqA7N3ZtsV
X-Received: by 2002:a05:7300:e9cd:20b0:36f:f3b7:6dee with SMTP id
 5a478bee46e88-3856f148099mr1509811eec.7.1795142809415; Thu, 19 Nov 2026
 18:46:49 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118051247.3885308-1-lcy8047@gmail.com> <96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com>
In-Reply-To: <96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 19 Nov 2026 21:46:38 -0500
X-Gm-Features: AclHuK_LbjhS7-Db8Zoq1dtarOebPOZsaYeLwUIwTxAs3oDtr1MYrA09Uyk3gnY
Message-ID: <CAKefsHu6P6FJAz6hV6+Fzm_PgXcTCn54WjD5pH0ThLC1A-DOFA@mail.gmail.com>
Subject: Re: [PATCH net] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a
 rule fails
To: Jianbo Liu <jianbol@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for the review. I will update the patch as you suggested
and send a v2.

Best,
Changyul
