Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776848;
	b=GfXRDHRfSdUqc2OuTLVol9S8AaSKi3NxgamfehJhgUdI8r4CK8jWHN1Bgm/SsZZrgO5T
	 WfWAXEdRenYhvroNhmso9kpCIh4XTdBX05IsVdn4Gz49SMR9T3JXItd+F6P/ovBS+7lh7
	 XQ3ideXvhtiezgLLEdUS2rZwjmOMCthe32dkZvdVoK/eTsvTqI1AYEtBzYMPs3dJUJFJV
	 HjxRa3ZeaVtueNbo+2GBsHzmwe5/a/S0s/Xl4Xmkv/HIgWjxVAOu2164l95in+XoYmwl3
	 CXQhI9RGLY5EylMU+pRBS2iRlmscUWHPLxADTVWfURsgRvgUhR+HphtmpqouHJpMMSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KtjE+y39LGbirxSIXRR4VoQCxmboKYF40P25tI5iNJk=;
	b=nbAkIqZfeNrTL5Ypon8WMhQelhiN7CXRqrod+CKe61WhalTo5/aXiObhEI3kx6Kr+LRj
	 yWQZBYR6Be2IRJwpEz0FE9/40Qr+0ywk7a/INx7Grevw1XpYv8xk/n2B4/9hIVOq24wzC
	 n/aL9Dd9bgydpzl8pAP3zBY8mU1UhsvuNeQ2ZRYwLKlCCJ+YffaIdLjB1fmXt6jGizoyj
	 QQ8Bj6Gq/7dUB3DPVcynNK04byXlc4+Z0n8t/Rc6IBjOi8DO+SkTFCymnOIUScKkLdcS/
	 a8L8N6sEj5EkcYuu9gLBALl3sKPJJz9mxFfcLxkIlKDCOde8GiFTL5tAdja9EJDyqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJDRLZtR;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA7606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJDRLZtR
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so12367869c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776847; x=1796381647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtjE+y39LGbirxSIXRR4VoQCxmboKYF40P25tI5iNJk=;
        b=YJDRLZtRKgK3UzAzZ/9roXYftDiQfz3ptAtB8V6A/is6kf1b7P0bzMLL6B8Y+1V9G7
         rK1peaWVd9nEl/bySmGSkk++VrwTNb6MsFY3+IAPpNzOO6ie5py4kbjLsEMagEC1Itmp
         mwdMIe0JeN79mofeBwpckqISeGbZXuctNdLaEDxhYYqRaPioOH8dda/bSH/OVoqDp01z
         XvppX/7t1wD5nmeiPncPlnHCo6/4XDpUrYxj1llBWuVF0kyZeRXe/lTTwdrpo9i+Z2hY
         LNU68MaTW4slkOapVv+TETuNMUpQV2sJMvalEP2xEBO3SW8Su4MY7w3fvkenEZVAg2b5
         dnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776847; x=1796381647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtjE+y39LGbirxSIXRR4VoQCxmboKYF40P25tI5iNJk=;
        b=vUQoc4kIRSZNc7s8YekEBi7Ta1pc+cuE/vQnfYfc90WJeRkyjcXHATWcZL/uRk+qa7
         Q4dd6vRupygEQDnn+CSR8aUndCzfqhrBf4V5BnEcTkHP+3faSJ462FfPZd6vNh6Nq5gG
         9NyWWP8rXubm9YKdKBWHQMjRC4lXbEoOD5KlqdO4/D8LhyyMXoJB3UM5HRB+HW6rgA5b
         QA57Pb0L05EWIILwTyzLraCiWyzfvIfOW6tdqUtUM+duNvG2qPbWOJWoYUAoGlbWgWbD
         sFMJgXEybBLClDHAl4wuzNzHmMRS3kNTADZO7LNpQwMR8/8hGMlMxul+uAJELaBzA3sW
         CFcg==
X-Gm-Message-State: APuU4Z+pHqYwFyT/0oS5v5achxvrNI0jfZqLAepgXRcMQKstldMQ+z4E
	6hjQ7eb92MRdCoRjQWJhpNFz9zrv06HkILqfg3eQo9KxO79FWO1Hd/fi
X-Gm-Gg: AZFdTZe7cCeyvmqHmFVe4yaWlTbaMqEKdTdcJBUa4rUJLhAagacAKOxtYbhCYlYE8Tm
	PQkxpSRgBtcDw0YR1+iWoWH8N84xJnbUKqoVBWPsD7bRYDhPVcQiztwG50wxTGs2ndl46DgOG4r
	tB5tFwoG0eHOM2CQ2Ek85Drdxk2OGTR4KoPJ7m22VvvfjCx355POeLjzIXExmGvI/zvuMgqARE1
	heuKFwGjtqC/t7h6WO/XiaGAY654mAqySy1tVcB9HT8b6kq9jbsjsaZlk+Y/B32h4xDuw4/PR6m
	l9R6EkivETeu508q84gRXpfKIR9Nf2+9b8sZxuzHX5rn5xlSwiQr//w2VnR6m78LlM1mZJ3CJ10
	We6F5zZR5XukmI0zjZEUjebc/lslFw47jhrEiXHVnX794wMFBkzP8GjX6DQgTW8+pEObfrSWte+
	Mb4g8cD6X0YOF/f9M8C+i0sP4rMqIp4JeyssvKMxz5Lmn1CsmmIUTfrPVqZMuCjkIX80tO/jqJ5
	GOaIWZRIt7eeShBapucFBXFTdyYq4NbaJDaZLFvmufiusaU+pA+sc23JZditIitBf6MRLdymxIJ
	GReKBua/2ghoZDuNyVRAt5yc7yaUqROdVZ8MwvpHP8Vn0tmOGUnqTL89CDp1vK6BpNUcmmIA2U8
	1KCUIJ5Oi73ghKJVj9GjEj5YO2fYzf7XGbbTnxr4WA+Tgcx+A5ZETFKOkV5FSA49fCjEGhGxQ
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr22058271c88.15.1795776847208;
        Fri, 27 Nov 2026 02:54:07 -0800 (PST)
Received: from localhost.localdomain ([38.114.108.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm54992326c88.2.2026.11.27.02.54.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:54:06 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: willemb@google.com,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	bjorn@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	Jason Xing <kerneljasonxing@gmail.com>
Subject: [PATCH net v2 0/2] xsk: handle two header issues
Date: Fri, 27 Nov 2026 18:53:45 +0800
Message-ID: <20261127105347.72997-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Cover more potential mac_headers cases in __dev_direct_xmit, including
xsk.

Initialize the metadata of headers in xsk.

---
V2
Link: https://lore.kernel.org/all/20261124083520.45547-1-kerneljasonxing@gmail.com/
1. address issues reported by sashiko
2. introduce 0001 patch to prevent the changes from 0002 casuing ICE
unintended buggy behavior because of using mac_header in ICE.

Jason Xing (2):
  net: reset the mac header in __dev_direct_xmit()
  xsk: fill in header offsets for TX checksum offload

 net/core/dev.c |  2 ++
 net/xdp/xsk.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)

-- 
2.43.7

