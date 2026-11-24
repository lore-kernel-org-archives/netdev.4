Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556868;
	b=KUWUxbTZMslKHDyL3KbJbNmSrdfXTxIymc/Hq2W+7KBVsSIgq2LcQSvPopN60V42octD
	 ea7N+HYpx4v+7bdp8OVVqacLMGJOGjAAtXGt8ePk1fNs4kWjYELeQ5gWECCAD7gOp9m2R
	 8JyoPyO+6fONRrmsgckeF0LvaRE/Q6aYFv703Ofg6ydSFhUvrFyJYIAklMHiMOMTlP+p5
	 B0EswNDGGYb5DLC7aVyNnKbGa835xsudSLkdGU7+lKmt+3wwY96Sy9j+LWmZpHtXRJ3f4
	 UlmcCUHThKbkZ1RxJCttZAleLEgI1iYJ4G15C0sgM/8jF7L2EcJCGJbGo8ATfhiQlRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
	b=oRM7Ydff3i1sG8qW/HoLu1woqW7TUZ+SDi4bRsHHGv+LOaE+n3OYW7W5wFX7T5Ve7bMm
	 jSKPrtpdi+klSFCM37w1a1cl0PVVHNdmoZFQMg2C7eVeqfF+aUQJm6x8ixD7GbKTZGuPB
	 XEIgh13E0Z5CTXPaLhnWNtEp0OEtTZ537QCjraNm/d5ZXESMX4VoMdCwFKkWAywrR7Hzw
	 MV3NhiLhN7yrogIkrfk1ZXtUOdO8zUJz5QPybkV9S+OhaR3A1+nspFIgc3zk3xYvRuvz0
	 IGNg3iaVws/WO3EtHBsPJ50eZLul2fo5xbZIBV4dQHVCi4/YoCUE/alN8jsnMxTuoXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NCjMwkm/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F3606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCjMwkm/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so4832905e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556866; x=1796161666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=NCjMwkm/CfTBm3rjRtM5Fi9y2811ZZ7R9VlLyqcxqvhLBTRQYXnfe6UG5hWXEa7THo
         lmXEhwSxX35dWoAP/Fpsi7mV1/EF8dKg6VTfvchlCDxGFwlj4F9dryFhw/KCTzJPmzGF
         ck6glT1WosE8d+8+PZembYMKaZ9XLdOSwxczNOyvFSTvDLl7N8YNsKru2uhftK3WSfIN
         I4hrG4DN8KupTdflQr+yImbACP/vJf2SRcCYfZumkWwLK3tPsu1edMsOuuoXQY/uTSjy
         0EAEkTyXkcyeAvKIMAhssD+8HMH1XD6XA4biQTuolPwlBJqygHBae+9nT6KPd4XLR82j
         ShKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556866; x=1796161666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=qZ0hPIJwimVnc+Lpq+LcWSg3m9OwY10Dd/S0aRdhqsFq5QT9Nx+FfdUxWi4JRd75Aa
         ceRRBo6RbDk2AgncLyWSz9LOrBE5UQbS/4vKWYl62DZfWRN8sD47SXQujDjuye+MMXnk
         kfEmX0K2rAoDp/ml/zOAsaGkW4vXhcM/8e4B1r9n87F3/B9eEZe3gabAY717XzaNQVFb
         t6OgfhCP9PLfSCe4guLTMdNZJ2wb3SFxOoWqwaWGHVNUPWkudag3yKhccG4L5a3ptnfh
         Src2tjEdClDhX/AudQrUPiPVUPPQJ8nLz3RW10QCKAG08KH1GIoL0aCJJGu4ZW6a+R9k
         9+UA==
X-Gm-Message-State: APuU4Z8/C16mmWy5x9QyAOSij9wOJ9YpinzjcDI60yDOn4otOYDvQXC7
	NNBPEjhAU60j2P9FfEmtqrupJY2cd5HJgb29nfkzj1Sid5qPtHpIVmakTmJSpGc1DfY=
X-Gm-Gg: AZFdTZeOAI/SHB/E4Fd8AM61rSOZmn6PaXDrB0L4lo02gHsxeEFNgXdjPeA7GQ9AQmU
	EAXnLGI684VRMsMxVxLLXVD9TyiHoHhSKcADj4MONCUt59dLPLHDglenB9AMPA8lfI93uziVyNt
	zSqDHnvq93F1K3uuDhYG0iCkp958EyDPMH5X4FbydF54t7fLtk13/Rzs6ms9CBU0NrYcjwKJf9O
	0zTTMnq16ql0cJ+KM6NkX1wNXQ1M1hlh+ejoJ+SK1GSofXmk/s/0iAk6nvahky6JHIzrfSbzl0f
	kxsaXkC93Nq4UT1puUbhfw0YcGGFpaOs/y90VsewO8j/bHNytj+7yJ1nsAmFedIk3YbenqDEBvl
	6tkAeUlFuSPW6/uvS2yt5QNXLOf/V9Hu54gTrj2xNTtvfPKx4PgKpVAzNawNZlRyZpacEfruvm8
	N/+jkCprbrPTGs5xXutV9ZE3PBm6fOCTFYz0T9yQ1wXi1YrwnrnKHrP5ALqohRwIcB1c20FsVDX
	84uA/e/7XGdFKRQIUirTFHwBM3kGrrQ3rVQLswapOIECtn2XHPWwgfmvDCVrnz5ZqXcY9w21A40
	Egx1/Ut6Kcj+6yhuVyaBxtUP+lwKxoHaBZvKAAvdwvPSi3uYAp0HHOwH5gMvtAfLNakzvg==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr314245795e9.1.1795556866565;
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm476404005e9.3.2026.11.24.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
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
Subject: [PATCH net-next v2] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:47:36 +0100
Message-ID: <20261124214736.13398-1-emmaonana18@gmail.com>
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

The connect() failure branch reports "bind fd2", copy-pasted from the
bind() block above. Name the failing call.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2:
  - Drop a stray line that crept into v1's diff hunk.
v1: https://lore.kernel.org/all/20261120063011.21557-1-emmaonana18@gmail.com/
  - Initial posting.
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

