Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408190;
	b=eG76F9yxywGdstwRTkvJDYEoH26HVRi51smUINEC40t4BltpLWv15NOPYCkML158OLiR
	 GnHHu9YzfR3ENsBfhIypQ4ol95Dowesy9vtV2WdI7x9bdoPNHUQ8xkLdMuE+jRN1AYxm2
	 Sti5pRW9Y5m6ocvB2FnVHiUs8OXFMboln1m1WJzJV+rtjYWH3gQHoQpcHEvc+jQaP8/Cb
	 XQEb0hbxxZsh/UKmJQxT0J1Y79uQAE7nxLU7ZK5gAABN+PwuqgO01YcjB7oys5UdW3Szm
	 cswSiGgpjkI49es4Xw/HatPSA1pXVDRgj7GFNlizOtH2c29YCEd5WitWJOUVctdjmxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
	b=Fitr4L8epKnsMo/hkRQE5bLdRBgxgaoiyy/olSq3ebRAToYGI5i6R9WMNp0HahN+Yl4T
	 1UhnGYSb/qZcU4u9LgUVWEYeYsTVC2yCHFatxIEqJOm0q9iB6qwfbsLHdH/Ly+iBrrNH8
	 FkcTBF0yM9SVkgJKrgUd2RO9o6bX6oqqFsqd3LmNEoLf8vjx9o/nVOZ5y0R3Cu5GXk+a8
	 W5aEQyJTE0UnwILoFff0LIjvVqucJYdlfRwXq6sUufolPXh413m0S/C/Z8Kne/4KFxP2Y
	 WoWxAu5zbZWJE2WLehaLitCbfTQDGKi1WW53J3ST7Knck8hsKSHQrBlKLcbX4JhiQhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYb+KgMp;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17E8606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYb+KgMp
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so6042772eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408189; x=1796012989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=FYb+KgMp5knJ88SNzdM6/goTPVmnC9olRYxHtrVa/Op5DIFfd5XMqAuVpWmTDNa28f
         aANnYXfoTT7RS/H8bWETqzCSHaIDsxhQS9YSTIzhr2KoWVGtoZudHGFxclknwBn+eQBV
         qvt1+GA1JJ49/e2r7RNUzuXWqJkw5257fLuh64SNvH/i284LqT+a+R2ndXIaZqil3yrl
         YgavGBIGVUYS7rzj//wXvOLDTcPhycv+wjXralfIycNNg+/T5GZiyws6dqehXD6TsvcW
         SxbQtP+Nv1FgVNljW1EeaVvWbuQoMoit6gnHq2KunX9oYLc2niK3l2F0q16q6HWIJ7nM
         knhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408189; x=1796012989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=hdIIJstMeN/F4Z9E1fh2y7AU9NqjMHvm61AzJe9dNUe2rPWVocCyezza6+eGk9LNFG
         UjbfKR1KRtcXX/LARXOfBBlUT/EHdGnJUM6yurIzwIDBq4V7tbfFKlXrmwRcM39zNU+N
         ZTbiZoLee4v6m5tbp1b4tdi0alanlWsFpLr31eTrZdX0XxyYvRQNqWhtB8/gC63ZLtKt
         1wZ97BvPWz/T71q7NM6mzUv7uEhnBKeijqZEIkzMw3lSlSU7G/+ZNIDhWULDYs84QD/J
         UMI8bIDiFtp9TwEai398cOqYrNpDU8SqthoxHkqzAgn102roKo7C+OftOMwBGwypx7Ox
         s/WA==
X-Forwarded-Encrypted: i=1; AL+hErErk+l/iOR+dA6zpoVAVCz58ndtPIFitsekbiARQMUeIbLSy7Ua0+6Ix+l3rEL0nkKQf+LMtzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zDS735z11CmykfytBVxTMfMdjy5p5BI6U7rrPKbkt6jwt7sGy
	AoFxbe0Fc4TqarHWNyrkGVU+bh3UBMeqOoTQdCvxZnIOHZdXCet3F4ff
X-Gm-Gg: AZFdTZftcyaX+6lnlGyFpeiUE3p7xW/cHG8H2S3/A/6tbvXWotafxgKNm7mXTJ/WkB2
	yso1FmaxtgiwFmD7TbMp9OXuckzt0u1kS1+dXlMsm4fkFAjDCqThhtcvJs3l0Pg1Xm92MRncerK
	iprnWJSMJyjuvO+vNT0Rt+4fhGhnNnhEmjm31IyRHDF3574Cc3WK8e+jDGrObg2wcjuub3G7Pwu
	TypeidFUlzG1+XGcP0SUuwnLg74Z78pqNs2bxa0EFQ8cXpdKPKs9Ike2NkWGp3+QkssShc8r0Eh
	qRNKPSFfLCB3PjIe+p2qwpBO2U0oANDM0SyEAE+NxMaH0ET5ykc8Jf5oVq4xhgsvUePcLmQQh0J
	hJnlwZ300RxZYY67Y7kE+q/91isKF1gsiZNisvMpR+EyG0CUMzmFzpqIZcasJkFPA8VuBxI4aau
	GH22PRCtZ2mY742NIw9GBLlSHvTmLFxvJ3RQyRh9juvS020DIAtwGoTIKH5/vKVOXtVbQXfRYFD
	XT8zWuBBsabEz1iQIoNQrFu/rocQEmi2fGxfXjbCnKgMvFXz/79wRuNmw7etAtE5RcRtsYiKLRA
	aNE6eRa/tav1fDdeRy7rwQE2D9DyTP4m/gmwFdZhNTQ3Dif9do1EWRZsUd0+9gdZPUo=
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr9290868eec.4.1795408189065;
        Sun, 22 Nov 2026 20:29:49 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:48 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 1/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:42 +0900
Message-ID: <179540803323.3139700.15088508372382876389@gmail.com>
In-Reply-To: <179540803323.3139700.5340002553684152759@gmail.com>
References: <179540803323.3139700.5340002553684152759@gmail.com>
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

__xfrm_sk_clone_policy() clones the parent's socket policies one
direction at a time and returns -ENOMEM at the first failure. If the
policy for the second direction cannot be cloned, the clone of the
first one is already set in the new socket and linked on
net->xfrm.policy_all. sk_clone() then frees the new socket without
xfrm_sk_free_policy(), and the policy is leaked until the network
namespace goes away:

  WARNING: net/xfrm/xfrm_policy.c:4303 at xfrm_policy_fini+0x24c/0x300
  Call Trace:
   xfrm_net_exit (net/xfrm/xfrm_policy.c:4372)
   ops_undo_list (net/core/net_namespace.c:253)
   cleanup_net (net/core/net_namespace.c:713)

Delete the policies cloned so far before returning the error.
xfrm_sk_clone_policy() clears the new socket's slots before cloning,
so a slot that is set holds one of these clones.

Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6454..dba1851f0b3d 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -2460,6 +2460,13 @@ int __xfrm_sk_clone_policy(struct sock *sk, const struct sock *osk)
 			rcu_assign_pointer(sk->sk_policy[i], np);
 		}
 	}
+	while (unlikely(ret) && i--) {
+		np = rcu_dereference(sk->sk_policy[i]);
+		if (np) {
+			RCU_INIT_POINTER(sk->sk_policy[i], NULL);
+			xfrm_policy_delete(np, XFRM_POLICY_MAX + i);
+		}
+	}
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.43.0

