Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770982;
	b=5l5k0apuK+PwS9c0oOoi75M6YuNvJAn1LshX8aEkXAxoVZywb7U91DiLXhVIhFVk/xl5
	 hat4NqHXdrxx4aI4nrj/+O/RKsht6EZkKAOsDxpJrO+jQGqhfV3fA/7wawCvpm24x3btm
	 Jep5atV6UHKWpt+J0PQYk5oTwytGX8MG/bnf9GJeLPtp4hb453FRstgYqW6+mvq7tKgji
	 ktPbQG2GPe2w7qg2oChqk87IN+2DGwGqseSafNBGONskky2bRcZJJH27/F51N6zrP7Fuw
	 iSgW0Fs9j1jvo8CWA9lXmt5dt/vj4ErQYdL79ieIyTkIsq5nZdCHj9R2daFHpOiPAxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
	b=xWUbpSTD4BqIjtGmqvT7y8cg4rkpI4v+N9Ga9OS51QnGWd3R0RUj/BjWQO2MreC9bcJp
	 lmEK9jK4WlYZAmE53tdAyUP+HUFNRkIODvE3AjoxwzlbqOYYYYbEJw/pJF5ISwhFQC94U
	 UVyqEABNBi0CA+/1ZMChYuV3yXFEw59WHJITO9/Ncsh5O3UkvJeSXDCF/zeIcitD/E1Es
	 fcBe8mEaahncS0FSY1RPR1dmifuC1C/inrJ5CR1TxEdvCE0rXOsYFI98/eoLpYcMeR/68
	 Br2FV7Orh79Rf0VDi/g84eaZ7Sp7ce6yiHk8iBPJfhMqWsn8AgbNtO/wXs+jA/4pJKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hgr5fBXG;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565A606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6565A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hgr5fBXG
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2f0f18feff0so4371935ad.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770982; x=1796375782; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=Hgr5fBXG0bZ3bzYqiy+3LV+7WCIIx1bGGoCLitdyX4rocGedwC5eIvB8pyCZhOpvy9
         /Zq9BN3CfDeXnsIWRlq70Tzg8eYVFG3SMeI1xHsNVeJ+A5XNXj6Xq9q4kYaqjk3A7J5x
         N4m8kSlcn3oQBTnMCWIV9C9b0/TuvBfhQdZoAYBz0ZW3ZUkcQTDJFLDj9WgJXUCfjsVR
         IJTJLmgVMnR5X4j+/Doyy9ZC8PWEqJzqHSIZz+By/Zdn0ryo5lfEfeMDjClZVuxKatwB
         d5Ygf4AhnNffkoEpkNMdhhsyadAfkD94s6D7Ra+BaiXNulsiLVicyQZMUIEV8VT8ZDbR
         eG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770982; x=1796375782;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=FFKbX5cLqw55QeWZQuH724agBBLhBRvjMkaow5ion/G5H04eki+v/siYPwqOv5oMJu
         QDzYaHX689y900Qt0tfJOEybs7MrlxwkBYNtDJ5pR9C3H/Qu+vT83BV+kMH7N7T/KgRp
         ljLJimepbTH7OWMMHp0eeMbZgv1YNykG/zuDxlqJC65ju5cCOAlzezi1lR1IB7yG+QOn
         RH0q1T1hDDCAA93RKQ2g2JbTm+SlTcaTsX3jhLB/MS03x+JN6e6zOrQhQ9Ryfpl2zpDC
         h5TCWOeoXXYEMPEhG8WjcISCJ3MTSHzRQURDuqzlrk060yuUwkQkFH6/Gp8Cw0rerZiO
         dqQA==
X-Gm-Message-State: APuU4Z+BEa5vYUcXuD6prPoSEpMtxhG87aRT7/xV2UIrJFiffZwwOQkl
	l+vHvfAiMMjArWK8K4IBcdaT/7P2Wl9LeE5MB7fHS7dcRsteF321egx8ieUmTUiWPAN2tg==
X-Gm-Gg: AZFdTZfKwWC++LE5tYct0L39dAJaBk8OzsLGmAXMpicnSxrCPp/Z1b8nazEOsW9O05Y
	ENUR9QcrBXId8rc61p/QdPqZKnK7yr4+FTm4Rc2HOoaalX/QvnKzwIqV8b9RdgfvoJg/Ir/6is+
	O6gQw0IIjNsYwVxGv1pADw/gy4eHi4xqLjx5hE4a6/PSLaW5PbTqxzBJx8po1yb/m0RWAYTTeOL
	rgR0pKxC7w4LmJh/6BblHyIKl1BIj/PHklN9HAZNkJ1PF5wDSekQhILBF7Yzs9/BD1lOLBsv9kZ
	ITtKq6iCy/bN5YOEbTao0mEIz0Yzgg6AEwpo336+j+y07pBs6jTN2FOY4fqUIM3qMpZ/9tGuQL2
	XL7Ueo7H8uwOnlRKHaoAqajcRSfHzp9BSp0Of3gPvtjmBYw3KXAGnSMiGiJzC4kEk/oJ+HgZ2w9
	5//9BKcM7nnPii+oXBZJlfwUktaChPjZGaLPhCkQCH8INPL5IJYfPPNkawzL/QLbQ818RpdzXku
	396ITE9Z6MJ2BvJDJQLgtuYGm+pOm95rLa39WPuTAxLXzGsmzSgrqX5YfXxrWIGIVWn4+GYAs6U
	XSUDC+8N/b4XBDhC3mPa4CIp4OipoGYj724/1X7mfNSPly5rLVf86SSkV8CraiQUtbj6KeRQNVT
	uDBPElpr9RQDV3TvwYDLyjpU=
X-Received: by 2002:a17:902:d4c3:b0:2ef:e20f:3eeb with SMTP id d9443c01a7336-2f09ca84710mr142455805ad.20.1795770981749;
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Message-ID: <624bf99e815ca1a98d13ef06684c86148166fe9b.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:39:57 +0800
Subject: [PATCH net 2/2] xfrm: fix use-after-free in xfrm_lookup_with_ifid()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

dst_dev_put() can replace a dst's device with the blackhole device and
drop the reference to the original device.  The device can then be freed
after the unregistering netdevice's todo work runs.

xfrm_lookup_with_ifid() reads dst_orig->dev directly in its no-policy
path.  It can therefore dereference the original device after that device
has been freed.  KASAN reported this race three times while a reproducer
repeatedly deleted and recreated a dummy interface and exercised the XFRM
no-policy path.

Read the device through dst_dev_rcu() in an RCU read-side critical section.
This requires netdev_run_todo() to wait for RCU readers after flushing
routes; that fix is a prerequisite of this patch.

This access was also identified during review of an earlier XFRM device
lifetime fix and left for a follow-up.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/netdev/20260908224901.1591334-1-kuba@kernel.org/
Fixes: 2d151d39073a ("xfrm: Add possibility to set the default to block if we have no policy")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6..eafd090e3 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3186,8 +3186,10 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	struct xfrm_policy *pols[XFRM_POLICY_TYPE_MAX];
 	struct xfrm_dst *xdst;
 	struct dst_entry *dst, *route;
+	struct net_device *dev;
 	u16 family = dst_orig->ops->family;
 	u8 dir = XFRM_POLICY_OUT;
+	bool is_loopback;
 	int i, err, num_pols, num_xfrms = 0, drop_pols = 0;
 
 	dst = NULL;
@@ -3312,7 +3314,12 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	return dst;
 
 nopol:
-	if ((!dst_orig->dev || !(dst_orig->dev->flags & IFF_LOOPBACK)) &&
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst_orig);
+	is_loopback = dev && (dev->flags & IFF_LOOPBACK);
+	rcu_read_unlock();
+
+	if (!is_loopback &&
 	    READ_ONCE(net->xfrm.policy_default[dir]) == XFRM_USERPOLICY_BLOCK) {
 		err = -EPERM;
 		goto error;
-- 
2.56.0

