Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205659;
	b=hGR7jTXZ8NVvzTIYvQKEQQ/CI3U10okE+ivFTW8EGwrmXMN1uf2Zop80Jxn0ggQvrSPh
	 lRf6Cv17IMdaCDGnvNPjd1VWz1IB4fWpRm2N6tpUCuCdCrCEOrol9TOSp04dIxMHDQ69Y
	 aLzVlFuZLzIU1ZDgKCLjrs9HiSm6yzYVewqfcXudQcA9NqwA9/rTveiMOTX0aHN+6oM9v
	 4szQ4IVy0eBq4f6UWJNxOIUfIzxBvbDT7yU9qQriN9/+yskacT+Fh2cz6hrH/36s9uy0h
	 H7YSQzU0mIzeOd19rAsCSYzWk4CEnEruL3YlBE34nLzui9pkiK/u0PxHZSPr68VAtbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HfSPNpjxfbCet7HZvv4D4XcilBzUF4litjLuOvyUKWI=;
	b=NfY2rEIKUmbhzxR6ywXOPNiWU/YW646Qm4MXIhUb8yYcke2Nl21gTmfK9ZhU4WxpT2Yc
	 wUMdom1cpo9z7K0XVvwwo9CK+UEQ/d4Mf9Uzbwrnl2c0fHKJZX561757fq+yumOTPulDF
	 QWS5mGMOVZjmtM1CG0F7e1c/IVFxVzCzld4fUvrFAhqEpRBicUQeQSkBVeu5CJFVVsOss
	 w8f1s4iYN2/Yj5bG8WEGUvcfdr9dPgW75/Q30IfwlyxjzH+On24D/WiVoHGaYTlal62ol
	 DAYK9m8gTWl40ehWmeZel3/GJQndFWvIK5B0fRZAWLA23hm9eonoev6j6fWHBmNwU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mn8fBnKA;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401DC606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401DC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mn8fBnKA
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so2702286eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205656; x=1795810456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfSPNpjxfbCet7HZvv4D4XcilBzUF4litjLuOvyUKWI=;
        b=Mn8fBnKAkvMvCswoslJ+0y1VYSR5y2G0o8XMjrSjWinR+r76uoRCAVeSPsj0+SsfGR
         PZ8qetTBAtwx9id/W48g1xy9d4eeYdhNyRjkbnv1SVpIcaFw0iYRmS+A0b6ClvFnnYmm
         TU2AXaVwjN4bMLr4rKMcOIPWjQYhQlCpgXncaKJnXX1AFrLVm8FwFxKyeuvE4kXYU4s6
         yECyD2+HcQQ5TfRpBCFBNWn+ro6kPC9oHLA2MZgABDQebPiBMMBeaBBZn2MwQn5rrqD2
         sv3jG/HOa2MPxk3Xm3RL8pcnz4eDFPivIMEsIGQ8sKPYQkzRhHEhtSxC/XoTTzbdnB0C
         EoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205656; x=1795810456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfSPNpjxfbCet7HZvv4D4XcilBzUF4litjLuOvyUKWI=;
        b=Blj8D5WAyhDxyEI21x/JaWMMYYWHM5JI4jSsYWb69dt/ZStNNU9Z2b/0zI96o7vTu6
         gZRH0+jsyg4P0fKU7FPk0TaIZwpxUBDXgAMgeaQqFSNvlkmd23e1TvC2NRi7Ok5Cwpx7
         VPERiyXfv488DKfGXj/RWVesz4iOF0jGIrqxnOqqGcmdnNjPk8OleoPE53YZX7F1BB/E
         IJ3GtOngiAXg6QVSvSPKXQI8lNPqNRRHil7odUz8mvACYFa5+aF388oa0wYX2KfWVUsA
         FGIPxGUDTZpGbRxzt5rRRaZHOwHceLJSfNGZrTw7xWrWnMKh1l5uTntwajZaE8Rogplt
         DeyA==
X-Gm-Message-State: APuU4Z8/1cE2NoQahOb+WCrngKdVqLPsnVqK8uq5wOUmcBXjDfoxU1Xd
	/9vVIl2+PmWZFDAnlw/j+GZvti7Jrpqr9tKEXjHRLO5eLo/mXnIqY6DenFlhGPM+CTvpvZQJRkG
	I+L+/n+j6upbTkeqgd3lEOVon0f+IF7LnhP19Glrfp9vBxRwzwZHSgoxjwt/DjM2bVQwE70I1FB
	7Lm331gOY+8VRCy8zjLFF2kef6JEUPlkIX1wDF8L6BTzt4Wfc8m3mYi7KZ+NlCP8k=
X-Received: from dybtt7.prod.google.com ([2002:a05:7300:f407:b0:369:f864:c5e])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:80c2:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3856eb492ccmr3982799eec.16.1795205655814;
 Fri, 20 Nov 2026 12:14:15 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:06 +0000
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-6-almasrymina@google.com>
Subject: [PATCH net-next v6 5/7] net: kunit: attach net_iov frags to target
 skbs in unreadable tests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

In netmem_ref_test_net_iov(), the target skb passed to skb_shift() has
no fragments and unreadable == 0 while shifting from an unreadable
net_iov skb. In netmem_ref_test_try_coalesce(), subtest 3 manually sets
to->unreadable = 1 on a linear skb with nr_frags == 0, which cannot
occur in real code where skb->unreadable tracks unreadable fragments.

Give both target skbs an initial net_iov fragment from the same binding
before shifting or coalescing so the tests remain valid once memory
provider compatibility is enforced across skb_shift() and
skb_try_coalesce().

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/net_test.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 19f422300d9c..1cfa947c11f2 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1099,6 +1099,9 @@ static void netmem_ref_test_net_iov(struct kunit *test)
 	copy = alloc_skb(0, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, copy);
 	copy->pp_recycle = 1;
+	skb_fill_netmem_desc(copy, 0, netmem, 64, 16);
+	copy->len = 16;
+	copy->data_len = 16;
 	KUNIT_EXPECT_EQ(test, skb_shift(copy, skb, 16), 16);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 3L);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
@@ -1730,18 +1733,19 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	from = alloc_skb(0, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, to);
 	KUNIT_ASSERT_NOT_NULL(test, from);
-	skb_put(to, skb_tailroom(to));
 	to->pp_recycle = 1;
-	to->unreadable = 1;
 	from->pp_recycle = 1;
-	skb_add_rx_frag_netmem(from, 0, niov_nm, 0, 64, PAGE_SIZE);
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, niov_nm, 32, 64, PAGE_SIZE);
 	napi_pp_get_page(niov_nm);
 
 	clone = skb_clone(from, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, clone);
 	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
 						 &delta));
-	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 4L);
+	KUNIT_EXPECT_TRUE(test, to->unreadable);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 5L);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_iov_ref);
 	consume_skb(from);
-- 
2.56.1.750.gf70dc682cf-goog

