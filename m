Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657165;
	b=TBMilxgePC3mNFF8v23anjH+ERK7eg7GrDVSjdbibCUxnm2v0SL+TRa1MFhWoaj9H5V6
	 PS38FtX5E0MPvRY/jO3IT1gH7BuF9zlmsVkUGQRKGyyMB8CUvSBgEuMzMYHIZSR7k9ANY
	 RG/AugUpOWwP8r0tbnvWaf1p1nQ4Z2ME5caXQb36PD3rROKXVA6tevVIg7IlT66boqpd6
	 bKkQYW16WEhIz6nLy6ellqEODWfCf2zR3vKhgZIHPjZ3jdDD7pwb880E8BuBckDnuYA5T
	 UBafdzrsDx1arhUk1sLWxrAK0HcihffKkv+eNAUE0dT0MLfTwjUfZV9gaZpO1oCSIXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
	b=pyyCMTEAX/8ckm32oDRdgfuMKcWQfMI1W7QZSgWHepvlYY9dpk189dbVZk6092pb9Vzd
	 NzAL8dqFmmhQQweipREQtxCx17hI69ScRuj5bhcrFAxF7/vwvx/Yukq8a4rg5GhRL/rGo
	 Ar0DzG7d/ndsWRb/RAmKtOjIxsjTC2H5PPcSbk+6dSxrn28ZTv4nqYjw4879cIQuoIbnt
	 V6J6hlFnK/GzjcLwxX0C8mi76vtF8+oRJqE7SzcqgyTz+FNrVsj4GwBIIMpiHPI3EzjOQ
	 huhlP+0gHqNPV4/FT9mv+RglxKBjDm2x6+v9zQOWihALu9U6MRn3mZrEdvflCUQhwyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6U9PXxx;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE46606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE46606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6U9PXxx
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so2733885e9.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657163; x=1795261963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
        b=S6U9PXxxEtF0JXngqOOGXo9QKTxCGJqS88mLrc7a97OkN6fwp9dpvFs2UBTVzJ+wnT
         eoRnGTMDvOZ0yjqA/SAMSao1uolmXhL6VawcHJDQD6FI8OXsg1PIX++vf3Vyy7V5xFsE
         7L6+51mhJQA6ztF8H+LN5JIs77kL2N2Ul+nyDLLdR+N0uiXuZsr/6njGUaXqz/uFfkLy
         8acqaloIZ8qIHYjoGE+e7Ty3cztsssOwS83Sq8HHCL4/9CGn+qPFsJ12BPq1F0qGoU8k
         FG01h0blYAjkbkmD3Bv5MNKStCHguWQGCUyeMqqiwq0EI6l6TPy7dHulEqRtXn1Rc5D4
         XX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657163; x=1795261963;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRKVGMHjS3p2r84erkyfVinxVv6si0HhmgQIB1esDbw=;
        b=lwQxZ3/xYT6JZoyQV5zsgiWP5FFwioAr+KgkDvqInn7+PyZw7P+WUY03VsRagxxB7O
         H0myIFDd69XTjS+PZQbHsrUawXzzF6sKWRvoUexHh3991EhJOxenYr77lWvXL9XAgHlE
         PEhvs25AyCEiHPBKevbdsCcsDq6n0KtdOHwylC84Gas7C1IukciD+F8af/PSVSrywZDx
         mWiAIDv6TQ1t5wDf7ICBsIcUFSexQos9xSHdjuEd0SyuMu8q1cRwRb+HIIzsiY+Ks+CQ
         JeakUEQ4zx7MPtKXqZmlGYYCh/Z9+E1BIPIIakKOV6676jud5QndygS+eD/SZPNsEmsg
         C8Jg==
X-Forwarded-Encrypted: i=1; AL+hErF/YhCukBirGqA9s/J8yAxooppjOQE/dCKpqRYvVkMjYjdGXS0LHp+20V3oRsdmhuuEwZWliTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xedOu+W9v4d/Nm9tFIZDYItcTuvSt/1TXP4WbHQjgFYe26nIs
	52LT4LwOCv/bjrjLeRU+i7iGue7vgVd69OdHB4D1cnAzgkSATz1UCsGR
X-Gm-Gg: AYBFou1nc/SNxPrJjCXP9w86qn3+k8JVYC4YJXnu05Igbm3CXApwGmjliIW89b/qAt5
	Qh2yHTeK3mt+YWWT/nltlpk7QE7hrQeX7F2CYado+qwUz9jTOFWqSffIXSZ3LcgTf98XrPpYUbS
	Q8g+uicfDxJ5o6J3wQrbZJQEGTUgURomJiOEaGSfVfc88+bEg6lDtoqcVCdMcs2sJIFUx1xA2ik
	eB57fxzkVVHqWRo5XeP9kLGk8CdJx1Ep+4V21SEvKMB8jqB14QnOAUOvsSdRANjzfnAnn2aE/ib
	VcdsDATXjePf5NqqFDgbCdyk7WYL5og5QdJPab+ViHgF5zD9NP/ztVkVPqhHY8k6pAaV6PDsfC0
	87eQbqmZfcxoQGCMDKbiI1fXptdSE5Y6Y63QmRajEhbqU36yeAbEdDOBSYQA3NDuzxXcTFjGE1n
	3El6qx+p/eATozAGxpL33+QcFLSqpr6eCWAdSiJf6pJGiBRXhSGRNv1eunlIgrC4wNUNTLhqnBs
	cKTvGI8bFSdtkDkLflp7VshfmNGqoGxo4T06fIlGaVxJ7Ulww5fRlKUkWf6g2Tox43FyHo0eoXa
	EgFugPwnHSVp5NTyBavb9C77gQ==
X-Received: by 2002:a05:600c:4e8c:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb60ba4a70mr41019035e9.26.1794657162818;
        Sat, 14 Nov 2026 03:52:42 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm9072338f8f.19.2026.11.14.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:52:42 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] bpf, sockmap: fix cork data loss after redirect
Date: Sat, 14 Nov 2026 14:46:52 +0300
Message-ID: <20261114115222.180345-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In tcp_bpf_send_verdict(), when a corked message is redirected via
__SK_REDIRECT, the cork cleanup path unconditionally frees the entire
message and sets msg to NULL, even when only a partial send was
performed (tosend < total msg size due to apply_bytes).

This prevents the more_data loop at the end of the function from
processing the remaining bytes, silently dropping them.  The check:

    if (msg &&
        msg->sg.data[msg->sg.start].page_link &&
        msg->sg.data[msg->sg.start].length)
        goto more_data;

can never trigger because msg is always NULL after the cork path.

Fix this by only freeing the cork message when it is fully consumed
or when the redirect failed.  When unsent data remains, keep the
message alive so the more_data loop picks up the rest.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 604326b41a6f ("bpf, sockmap: convert to generic sk_msg interface")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/ipv4/tcp_bpf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index 8cf63a9e7fed..e6a8184aad6a 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -499,9 +499,13 @@ static int tcp_bpf_send_verdict(struct sock *sk, struct sk_psock *psock,
 				*copied -= free;
 		}
 		if (cork) {
-			sk_msg_free(sk, msg);
-			kfree(msg);
-			msg = NULL;
+			if (ret < 0 ||
+			    !msg->sg.data[msg->sg.start].page_link ||
+			    !msg->sg.data[msg->sg.start].length) {
+				sk_msg_free(sk, msg);
+				kfree(msg);
+				msg = NULL;
+			}
 			ret = 0;
 		}
 		break;
--
2.56.0

