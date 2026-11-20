Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135886;
	b=o9F+mL/Kxke+1fTD92ANUdjNQDCuYSFCiPfIgRKAvVbZ6a185IDjJou23yYizaXFGPpv
	 VOfW39pozqA8d7K/W23lc+K05wKz++rD7RznDqMNorAXOJKiyS+nmqqbPrb/fDiGZzLD4
	 MLhkl2spNICHcxSUFtA/pkL58RRipAYZyBWeP+HagFe1T0c7AZBFKcilvB7NLNqXL2TWk
	 28OUULEtwrCb82J5nWPctNaZn3NFxZgrb84UtBq5jUlqeP2GdRw5vAE2q2TnkAUudWez8
	 K54pNs2FVX7y5byTOM9gNsXJnhZYNIHcXehlYwSBENE1xd55mn7tEZa6f/j0e2yHJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
	b=2OHopS74XkQRfpJyTU4yaTRur0Uz4Ib0M40L9RXXX0WCWOxm7oJrSartzyRWeX7h05Hr
	 r1GNaRB8Kml64+yn2IK2vCB0kY179J5U5iToCu6Pd0JBkvMloUZKweJHJmXhhh15+kbsk
	 8BKZrIzVijO3RKmJFMKTbIo1One6egcCj0dnXcT9qRo9DCN1mE9YpKQ371tueub1Ql1T2
	 OIhX3sZPyvJp5CbHJpVy9gRmWZNbEUWRzdroXLY9om3wlr3zLkb3s5Sw16sX8SOkgH3MS
	 XIu7XkoyZu6mtRrgU/DP7urmBrDLHZUKlQ/EXLYViMimKc1YTGHKon5Od4JzXmI3n4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C433606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C433606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so3049f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135884; x=1795740684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=TQdkukrhBBkFfoTiiiGJGY0UEZ4/oft8+p1wL+VxvK5DACg9U7lVDzr+Ce6lOSv1pb
         TuL7gj5RjQnzw+wFNjQW5WARPqC/lKaRQOuyUh4T3NJHJsT8Bo9KBHLJW9BxeC5SZhJH
         BG4UhRJBmDRKLfKRb3cPYz3NHbqBv9yCukpO4/6L2L4HAr9b8Ny59pH5q3EZF2dnnpml
         mrnplb17wZXRZjec42lZ13qhKQVOL4BmSpnIBiRAr3ilLfRYKrPLzI+brj8Ack6cZRSz
         ZWIqm4sGSGLEkK7NR49xzqPeZhq5ZBMJUsGaNvE7tGeoWpS5t/l4VWQVlwtpnq9BZ0Ck
         uLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135884; x=1795740684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=wqQ9l/eaD26BW6riLKhopbxDOoIf9ZMXcf7iz9YcIU8nVMOjUs9F/mQHyUEUxWke8v
         l3qClAx1Q7vrhiifN7xvBfRxAfyiXAjpowO5gUZ7+iVplIcRA+28DVGsHE8dTb+wMuAF
         CtzLxQ0ce89qLC5UA4uiTV8EszxDWnhePcXxXdR/Yk3IQhfFGmsJHI2lekZhRqfAN/8W
         +1y/L4POk6UWa59FVZdeuz6KL9jWh03nl0TDKcUHi2jz2X5P0A6zG889CqAyeztVwdXB
         qbNB5wv9ASL+5m4daF557ZiqgSRgQnOrm+2gPeuRLkG2yf+OzaEeWpRt46Za3TUPA2bm
         ewEw==
X-Gm-Message-State: APuU4Z9JgXY4T/RlT3KQSbV6jdJh/PrSFuCc7VAdN2NC+8jXYVwJi7cL
	ILeUnZEPWdGUle5Ll0AaoMWmKqjo58uD2zDhrQvXm8yQEc9xk674Y/kK8b6/jRtFccp4ug==
X-Gm-Gg: AZFdTZfqC7/soiQAyKHPOevoPL2I/GUTzR4QiDBoJkHlKVl9uKuslvT0MKQ6Uy82xvS
	juX4DHvEw4Zsfx6mH5KEvtSUMkdR+//0JmyyaMhD080FIE/3bu0RhDoAasS4eY1VxjyNx0M22oG
	v9k8BnDz4u/WTBk6FZZsm5ahv3Dgbuz/GLRRosaVWQngrXNQ4kHcqsOFgVr0tcguQjYNQX4UjOC
	Bwsdwu9acXkxuWCE0rOz+4DENl0Tb9zOLxak5F8SefHmvDzylfxqHPTmFEeWDZIKfLL/tASFsKS
	YHHklOZznnkn7DCthy/2gvDJWOb1uAMAw1zwSFM2+Rf+eHzAcNLpemxtDBpQkypi2YxD4QTgjMR
	Bv6RDXxTv/5D9yTRSl1lV1iA0tO5I7b7rBz+WfrgYy0kPiKRg+vj2AuV4nBLVsaQJZJWzyzLApf
	RN0AZnDUxwxRNvauXxJBOg6VdFrsvM2w/UKBDbNn8EFqX4FZ4hJa6YYsEAr7+WnExLmjUbXqV2X
	arf08A2qdoO3N8xHGsSh98qxfsdLebsFyQzHPDRO3PaKcAkFSJO1t+POYGZKnYMqNlkYIpTxPiS
	OmxJSLr4H4L86klMwqaRDoUvXPsnXaftCtK4uu1daYrNC/j8fLR9oM278aMrC25B7A5TaXfAqg=
	=
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr2128827f8f.4.1795135884298;
        Thu, 19 Nov 2026 16:51:24 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.222.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm2269315f8f.20.2026.11.19.16.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:51:23 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next] selftests: net: socket: fix inverted failure diagnostic
Date: Fri, 20 Nov 2026 01:51:02 +0100
Message-ID: <20261120005102.18132-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When socket() succeeds but the test case expected failure, the error
branch prints "expected success got err" with strerror(errno), both
backwards (reality is "expected err, got success") and stale (errno is
meaningless after a successful call). Mirror the sibling fd<0 branch:
name the expected errno via strerror(-s->expect).

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/socket.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/socket.c b/tools/testing/selftests/net/socket.c
index 9e270548dad80..7f075acc0b19c 100644
--- a/tools/testing/selftests/net/socket.c
+++ b/tools/testing/selftests/net/socket.c
@@ -71,10 +71,11 @@ static int run_tests(void)
 			close(fd);
 
 			if (s->expect < 0) {
-				msg1 = strerror_r(errno, err_string1, ERR_STRING_SZ);
+				msg1 = strerror_r(-s->expect, err_string1,
+						  ERR_STRING_SZ);
 
 				fprintf(stderr, "socket(%d, %d, %d) expected "
-					"success got err (%s)\n",
+					"err (%s) got success\n",
 					s->domain, s->type, s->protocol,
 					msg1);
 
-- 
2.43.0

