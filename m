Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761016;
	b=E9ffc3jQg3astTsbOaQThjUQtAfr1PzPjCXDKTLesMyMOJQDOmtnpHXmYLchHJSNvLnM
	 oZwjdJwv6giuDP3wZKp/8Vy/VyYZbRZCAXsoWO65CWFA23+VcM9Q0mERxhCH46wj0VQzQ
	 MM18G9hjRlKlYNjESX4AhTm1um/33obXDUSnWh1AbwPamyqGb57kU/M6rEqpLkFfif9fT
	 JlAzsp50hiqKOH4qsXFef7vS2Z6cQzxSXyIT9I+V3XjsxsesFo9VRLWAb/ZLICWIcw16k
	 kw2fS4CbpujGUl6R47kNLOhaUdFO4QqCb0AR/FWJUAr9SN9/o94GfRm563407DbkmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cTfmIHRGVE8S+cRM5UCCvJE7NaV2twJiHE4lBOrga24=;
	b=qp6aZU+gG2C+bKuLHdxKQf81hBTwP7+yq52SUtzJc0wI/D7lbPB4xoi3QoMy0Vkd/h/x
	 UjwUj46cLFf3i6H5Y+Qy1SjWZpPt/FJtf594qf4RRXmdG5GWLgcD6GAwqqohSLIOv/Tf9
	 9NeAivUvJsdanXIZ51s2K/fon5+CznGiyp7UMlzpYGP+f0ZFtKdwXkR6vOnYpz6Ci+81V
	 f8g9NMoeuy8xre/EkrE8j+gaRJ6T+W3olynVw+j8zSUk7mBevF7JA+dJ+C/ymEMFMITrs
	 0Jla5MmSKz9E1WNU2Gf67s+wzcY7sXAnmdMvxPiay4gzkKcH1nX73fnxBYaXPU5wgAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nz3AqsB+;
	arc=none smtp.remote-ip=74.125.227.196
Received: from mail-pi2-f4.google.com (mail-pi2-f4.google.com [74.125.227.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5E606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nz3AqsB+
Received: by mail-pi2-f4.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso1451289a12.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761015; x=1796365815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTfmIHRGVE8S+cRM5UCCvJE7NaV2twJiHE4lBOrga24=;
        b=Nz3AqsB+gGaaEBP9kjrs3lWWZw5lvB5fo3U2/tX33uVcYFOmBVfz6kdJmsWoBRRC2Z
         EzWeYyNsPsAbDvZNbyxekaB/5s2lRssi/VXghmE7UuZ6CLVN6iEzN0qQSrqI97bSXVIn
         etAiJSxHIfSytOXSq192Khr1a5P7N6CvjKkTA9VQBKPcHPJJxqehdj8fPJ4RM/quZVEk
         J0TkkWLHtGW/6pCzfYsgWuk9N3eueGCK5MsCN4xrs6Oh0DxaYlyxa7NUazpU2n91Fq7C
         Ovl51ko+jTEIMMEjOFWE/4CXdLZHdSFgU+xE/ChbLq/QFJWkn0PHw6heE81EtVfs6OUK
         +6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761015; x=1796365815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTfmIHRGVE8S+cRM5UCCvJE7NaV2twJiHE4lBOrga24=;
        b=TEssGcHBzUT4w0IQNaIiFVgDuRk6V/Jx7ft1IVmeC2HBT/zW1TbFbTiFq07fnZYNi2
         PMbBvYXkRHWpnLuIhrjziAm7+VC1Yu7dteq9j+ZNBbDFTKJMI3ghNjekJS4l5TvcXc0c
         n2ffpEC2jyWJ6eW/CJJ/igKsh69UoWIvCHQEFzJU3hyVGbCdiO2T7F68MY0EElTuMOkW
         J3tXKRVKvvtKo91yCwQtzSlE9JSeydTWgDBscV4VaLH/7GzHFDO14TfzFSN72z2mvOHa
         cBBrY20o1SaxjEJTPto2nyW3tv256dHD6FnKaIcKP3LkuawLn/W152c7oJJalhMrpHBg
         HNHg==
X-Gm-Message-State: APuU4Z88tSEhXZFTOA724XPNKPh2ptq9j3zUEanGG86twdtr2VVkr1W4
	d7UKpUkExkSDXLnseQqjiFswK7rZxoy5mGnQV8JaHjt4MnHW+SGjqEjb
X-Gm-Gg: AZFdTZcBrE3k6cD5A1l47Ie/ROofKuL9+e/2NtqMe6i3H9PBftE03uLr+mYvOLUBtVo
	UJnGIHeTJnPl8nzrrp9wVe/Q6gka797AzgebFxu/A8WsFTUk5Ku+QflZroe9Z4sew03YaJNY0qd
	hXL12ZrfQp8v96XpmRo5TacKVriHqZRPRNXVIokNInXIE0kUwlu7cj9dwtwastL1/+wh2M9AOgP
	BBy4CQhkvPSpAW2CXdf9357YK5a1Zjqm0bx6PBZxpi0hzlSMb9718gB0MHBvcWULYx16HjYTYQv
	OREnMh0lIcbh/cKDYVYTwwIC+Dg8YgQR1DeLFSVexyqRBMdyICUETwCZMLcnU9gsTMziucTiQU9
	Q3HRGjMtX6DPOadYQdFV7zO4jWa1fXTMiJ3d6TL6vLo9nuJbW7bo2ktSOuxxOi3UO7L+JPJkspZ
	1rWWd4QE0TUwE1V5prZp3M8S4LIWdyDlyGkj3aL96wWycZQHfb1EGFzMsaORKEZo5NBwu0hz4oj
	/arZJeJYllKix1m7UxwzNngX8SnyWspdF6BtMaxM2DVRwkrAUyYIQWKDYuq80sEz/w7Vv1E2Do1
	5l3oBNrxHcBjAYeLGvO2hWSqkSVxsnvaTAktcW9ebxThJlvg83A6M7AbnYYx6tn0lDe0iB8Ha0O
	9
X-Received: by 2002:a05:6a00:4207:b0:88d:8074:1a7f with SMTP id d2e1a72fcca58-8c87bac53d5mr18569253b3a.12.1795761014975;
        Thu, 26 Nov 2026 22:30:14 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm11633824b3a.26.2026.11.26.22.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:30:14 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Yotam Gigi <yotam.gi@gmail.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>
Cc: netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: ife: reject headers that would overflow the network header offset
Date: Fri, 27 Nov 2026 14:30:05 +0800
Message-ID: <20261127063006.2908187-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ife_decode() lets the packet-supplied metadata length drive __skb_pull()
with no upper bound beyond skb->len.  The caller then strips one more
Ethernet header via eth_type_trans() and resets the network header,
whose offset field is a u16.  With a large metadata length the offset
no longer fits and is silently truncated; the packet then carries a
network header pointing 64 KiB before skb->data.  When such a packet is
forwarded, the neighbour output path pulls the negative network offset
as an unsigned length, moving skb->data roughly 4 GiB ahead, and
dev_hard_header() writes the link-layer header at that wild address:

e.g. on mainline v7.4-rc4 (KASAN build):

 BUG: unable to handle page fault for address: ffffed1040e0c000
 CPU: 2 UID: 1000 PID: 80 Comm: poc Not tainted 7.4.0-rc4 #9
 RIP: 0010:eth_header+0x56/0x180
 Call Trace:
  neigh_resolve_output+0x388/0x840
  ip_finish_output2+0x8fb/0x1b80
  ip_forward+0x1388/0x2030
  ip_rcv+0x228/0x270
 Kernel panic - not syncing: Fatal exception in interrupt

Reject IFE headers whose total pull would push the data pointer past
what the network header offset can represent.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 1ce8460496c0 ("net: Introduce ife encapsulation module")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ife/ife.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/ife/ife.c b/net/ife/ife.c
index 2ddf725d3389e..272e457517360 100644
--- a/net/ife/ife.c
+++ b/net/ife/ife.c
@@ -79,6 +79,14 @@ void *ife_decode(struct sk_buff *skb, u16 *metalen)
 	if (unlikely(ifehdrln < 2))
 		return NULL;
 
+	/* The caller strips one more ETH_HLEN via eth_type_trans() and
+	 * then resets the network header, whose offset is a u16.  A
+	 * larger pull would silently truncate the offset and leave the
+	 * stack with a negative network offset.
+	 */
+	if (unlikely(skb->data - skb->head + total_pull + ETH_HLEN > U16_MAX))
+		return NULL;
+
 	if (unlikely(!pskb_may_pull(skb, total_pull + ETH_HLEN)))
 		return NULL;
 
-- 
2.39.5

