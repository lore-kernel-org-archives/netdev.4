Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285665;
	b=Zfb6zvF3MeIh+9Fkt3iNPl5vM1v8OXt6I55MNqjTjEa8CmlhaIGkljmWL/fzahFAgZ1U
	 HlG5F9ZuiWvp2aihlkop3Mp4aYyiBrXJQJtu2oJ7jdUrtrY1XiOkaO8hyyKs6I9te+b/7
	 EtkMUVS50Eckjfr/w+J/3KKrKrjQZMSLr3+5RUup9uolxWPdd4twSFChXGBsdrgjtAnYt
	 uInxHwzyVrCMVgcqQ5/I3Jm4zGfF2U1V8vt/gdBiNwV2cTRChGgckMcWlj3ZMJumicRuN
	 YqD/PhLNIPsmbWQ1wPUc3ANbzOMgWoHX7/M5CS1nbb8LqciZfnNGspjYx+RCcdUxQiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
	b=LCO7n4Te8v8dLfVbjPlnFT/OinkYjho+wb2sFbog1i55g1W+A12x4pq8w/9vEXeVpgOr
	 T9Rw+QBg7EMzimxH988pd15vWFEfebs0PRX6BOR+m8N9UIn0SuD6xxxM6OfHAjuKPwNOu
	 fzrSkc+8YfjAj/NebdJrrPxDuROclRIJIf3xXSAoNRUm+VFIEVMURuP1Ziz4ycPWslQVx
	 wJDKouD0UuVL8Hg/dcsE4OX5c4fvrJi35Z7kBe1rPAfPLheo0Fot//pdXNbWcPFF+wauu
	 Z4JD+7QDK3IJMFw05/kFuBgFUF2JGJqllUscTZStcWV5M/sPr/ApHXXv04SKV4p2kvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA78606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA78606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4af52002471so2383945e9.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285663; x=1795890463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=zXUPGsQLwEGN+zZGgQ9AjMgexb5EbRMM7gpPxJDdobyNUS9iZUN8Y6df7qz0H/enee
         3ctFakO8DuPpa4olem5aEcHDy5tiXtIqRlvedpEFh4EYARvvHUS6rpLYqSCReB33iCYX
         MW6CfgOn//FkYORRt+7zqN92XcOhaHIW8Mpp6RAQmUPOgJ3RqyDgzpzITQGb7U6bCIRs
         1TPtoujMNEMP0grI7TvSvT96s0We++NnfDI4HQ92oLQEfo6sztp0uAWjLEObFUc/WV2g
         W7YdhrpI9uD9ooGQLISmiiQM9U5XT+Fmyf5JlOKFpmHP7zdAVWGPJ8t8TsvOMb+FE/QN
         V+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285663; x=1795890463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=W14CXi3mv8eo9GcmIW9KRJ5iAf/GRj3H6eT38OkMavZZAPvsLGneUBSOCAzFveT/+r
         g/WPcpp2SLsS/MS3aBJWHGymfgi8OeMaia6h7R1DuQB8jpzuXXEuFUwL/A+QS6plxrqH
         MCn3PVRvUAzKoP2r4xI8OkVjEIhUqvEuBz+hSgIj20q5EIHnrBc3oHyRltGomUAIDLx5
         lRS6b85U6yBgj8LBl+yHY05nJ4zfL1A5rRqs5CD05SLI0GqluA2jPBAEakCmwHqaiS8G
         jUq0UMQc0AbaxUyfaC14Fno5MHvZcpOZ7XiasvifrAQeYeNJBdPuThMfiwJCa1HHN4qe
         EGZw==
X-Forwarded-Encrypted: i=1; AL+hErFyzkzYPd77t4ECkwHzXsAPIP/M10TkABctHlS3cCV8rIpp/zmOX914XpNo9vpDV+r28sDYFdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aYuAXBhqjkC23dWAz2zgRfQ93hRHL2SsRMZ3Bt28jYgJ0oEhf
	xIz0xSItosOfBy3/sj7NAvt8aOXeZdA7hlYprQi8QyTiHA2cj93zXkOX
X-Gm-Gg: AZFdTZf3yaaEjPXKd+ZvkTjuU5UGsUTyZLkcU5vp+UGJHen42MM3dbjCBGQH9tLPDmQ
	elrJDNUEkxr7vo2t1nIgiXLg+oZbSvZZqbzDj3P9OqeWNoCtG2UbS5YNto2repMa09YX1H1sTqr
	bU2vk/hhu167Kpu0QIQMVWByQXsqzxwy5IN84JRoFLQHIcxU/3CSGL8aanR/TyZmEcM5GBrgHl4
	uLs+DmupwV5DjVLwiifZhI+2IanQRBEU5+qkc7P/OMnO3XOnGkqqX9RqvmsWp1PtJHstyZZkcO5
	Bnka+upifuA2U+woTh8r09nmEaGtPtn7W9M13Bx5fTiDGhl9dUx3MzI4NurtmmeC2Q5avVQpzho
	3HWsNZp7tAJfdPnsz575eZh/ArAwU53RMpvffjPYx4z1n7cnzF6gwFGLhAL4CTPLovow/jJx9rD
	Cobkzz3vkOcV5UDjsRmmarzkpkFBCpzRfbYBpQNgH6+MoVVYLWyqpf61csmFWGmphteAl0DWEJ4
	Bplfb5gVML8Gx5viis8LKsMrXWTzlZmcZf4q3YgCrKM3yAFnFf9YjvPMFjdkH3UK1pfQy2ai5+A
	CCJQKJ/vIXuWrUDaONxsTLrqpzrmcQV4biBQkJ/Dxpwl/Bap+mKKEoZPLqaLepc/zggkcg==
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr15300169f8f.2.1795285662799;
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 2/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Sat, 21 Nov 2026 19:22:16 +0100
Message-ID: <20261121182217.4609-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..7a2bbed0263e7 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

