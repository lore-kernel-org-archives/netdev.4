Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938341;
	b=C/i7n6vUQw7mOR3LcXl9zEUakBA7XFjIMrrwA8DTKxZTnLxIAAboGKxLqdiLitiKiSmW
	 LHboDenHmDq7mBqmf1X/2z8rpaZY7HUhPMiPFUKcSyR9RcphHhjJRQrg45RsDQ/x+aNUk
	 nKO8IoA9fxfecWrV7f7hw8TVuKNNWE+HFLT9rkpDX/8tM4sR3UfmXJ8m4zcVyQq8EkYo5
	 xPCgU+pcr6K/X58G4af63yduQQuAlNe5LPibhcz00RJXs22D76uxe2KaZwEUqJnmT4cfn
	 B07ZFqsXmH1aSn5Tlmq/XyFzRRj4sQUvxDlkwFpmlYwwDXBFsbJm6QfoWs1dMsbHRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eeMFyQdeqRi5I2iFwKqkLeQDvy+259l96uYLdOZ0I4E=;
	b=h8w82Fvtz9RXLjp8V0i14AU6F7qohuenWUcd+BbETVod15ODQe552//SnY8+IZn+tkEN
	 lIep8FamFSI/hdKm/G3sCnJdm1NFdKxtl0oTo2xny/PhNWy5q0focMiN7Uz2vuwR29HvT
	 4SHjP9d9uHsk3xfxYyT7zAPtOeUYy3iPcNKE6JusFVJsbB/7QthzTLLEdSfDb7xkoK8zW
	 NPvPnJqvRBxnq1V5E8xdqdvdFc9hDh53E4DVhumduTbYbpY+rY2JT5YtCKl2VeWh/gZz2
	 2aWcLgFw94eaxwKX9IZtPTcZLtuaHkNvkBdNjjRuStKtPbfSQ6PHc+2eBzTSVmX8GMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejwlZkxr;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED249606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED249606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejwlZkxr
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso166447a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938339; x=1795543139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeMFyQdeqRi5I2iFwKqkLeQDvy+259l96uYLdOZ0I4E=;
        b=ejwlZkxro6B1K9ewd6PVBNay4oobYKfkcQzDZbLMxFSK+a3XN4lU7szJxjXN/i1ZvE
         ft7Miqdl+ykTlBuqtq82ZELfSMITqtepYILZP4kJgCWSikDh6d38WNYsRYWmPzwkxmvY
         Z2Z8QEwezlkJ4CSv3nbuOTHTlN7cOi/+s+rlGskqKN3yFRDFKa96KhkT28ICHIislsyG
         c+OH8zYKjCIoYDmzogilW24vtzjGstcMIPEj8FzAwpDLeUfuG6yYSYYhrOwrL8ovKYsb
         fpKuszOnGsu8ksVr0qp7EjDy2ZFCkKtOQThWAomg7a2FD8f/v3h5iDh1gQsVsayXeHVF
         mGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938339; x=1795543139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eeMFyQdeqRi5I2iFwKqkLeQDvy+259l96uYLdOZ0I4E=;
        b=XdsJl52tXovGWhFc2QQvYt70W5GOrVnR/3IsI78ALpnMLWF+ytm3cJw7n4i5H5yJg2
         hRJEZIetfZXUbswn4QnAXtZdnUmKkNNItbs61tLXObo2IMHZVLZo+f+d5EKJF1dRLhkU
         pUGoxG6CI4amyJWybepaw4ygY2dembJPXnl70VsVHm+aLFEXPCcoXfriTu6emgsHqjIn
         WfEmhUWuh5R8rsrosZPBPigPkJkKUKndJJw5eDwpSOEEAIdoIzRkQpEU7Cv+eUx8qsM8
         QPC7ckZOUhYKJ+xXN6HJHHWvpcp13fy90mWv69AeOMF0+ImymSEUq32R+XB7L4XKAzr0
         xovw==
X-Forwarded-Encrypted: i=1; AL+hErGPpisJCB8DaGJ9fin+tKylFvtTPMhYa6TMKUkcvngCqlJ+ZqSkjGE0aLZdwhMa2YFJFw8sqf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZUe0RjvamN6H/znIqtDXE9Jy9N2JcqthBAsrQt4PSciIJeRLK
	uwfmrGcjB9ZKkgNoBnoZkTNksoDO6KhzHmkFgIhVKN+wWFpxkhYENjTH
X-Gm-Gg: AYBFou0Ba6tOt7vqAoaOIAs8pKF+lJLdHqWo6xuWvSwDP44XlO7dVmrqkZdKjBUTjTr
	U0qxWdbyyrR0f7gSEjDZbLBqKXcnijDeBI8eAR+5wP2aEVwiIwSA7z4oSjDSH80yu0pTPJgJ+Co
	/9SojG67jvFBAimu0TRzwtNoN1evLi8y44T5sWlu01wveEoKwVx70yY3P3+dIhomoMwy82srJXc
	t+1r8s+jDnEFK0OycKRXoBbThZsqv45m3LNDP65ZnwV9rL4Cf3NFcZKQ0U5HybaUs0yyTp0DMmP
	IPC9eYxTd9pxivTKmx0N8X5jUsV1c1aXHOpyNpHy8cmjlHAPIYAkirBYvKyGYqhNA8FSL1ooQw8
	/q+7V1GUL51AebLVCx7NPKOGs6TQ7YYRyxLQafEFv3X9juc3gVFld7GBLImhIkE+EF+L+IVHIWd
	z6FNsIkBCENov0oynWfUm1OcZQqIc7dnEFoB2cnaPpXtvyqHUq9tG9thRtnJpoVfBZBe9tMoiSw
	DhktNmfTLUOfBeckv9qwHZRLWtkPHk21QR2V503d8oB2jT/2gRvTFUUAHAInijSnEdAgF2KLeS3
	ZR4VrUmRO1w2QG1LOc0ogUDxw+Qz3RBp4Moq2mQg3KfXMQ3wg6xeiM72QxFt9Q==
X-Received: by 2002:a17:907:3f9a:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c510e28e068mr4634366b.9.1794938339308;
        Tue, 17 Nov 2026 09:58:59 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a82951sm78666a12.9.2026.11.17.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:58:58 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v2 2/2] net: unset the mac header of a pskb copy that points into headroom
Date: Tue, 17 Nov 2026 20:58:35 +0300
Message-Id: <20261117175835.745796-3-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117175835.745796-1-theodorlarionov@gmail.com>
References: <20261117175835.745796-1-theodorlarionov@gmail.com>
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

__pskb_copy_fclone() copies the data from skb->data onwards, while
skb_copy_header() keeps the mac_header offset. When the link-layer
header was pulled, the copy's mac header points into uninitialised
headroom. nft dup is one such caller: a link-layer payload read of the
duplicated packet on LOCAL_OUT or POST_ROUTING loads those bytes, and a
set element returns them to userspace:

  BUG: KMSAN: kernel-infoleak in _copy_to_iter

Unset the mac header of the copy in that case. Callers that need it,
such as the bridge, push the link-layer header before copying.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Florian Westphal <fw@strlen.de>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
 net/core/skbuff.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..7f6d0344efa6 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2278,6 +2278,8 @@ struct sk_buff *__pskb_copy_fclone(struct sk_buff *skb, int headroom,
 	}
 
 	skb_copy_header(n, skb);
+	if (skb_mac_header_was_set(n) && skb_mac_offset(n) < 0)
+		skb_unset_mac_header(n);
 out:
 	return n;
 }
-- 
2.34.1

