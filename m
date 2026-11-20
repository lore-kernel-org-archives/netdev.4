Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187211;
	b=pO1s9jCInCpUEiZesMRWw0sehxtUZ3OAnkfyBJ/F1T08rsj4N1zOpIfXbm2vXyQvBfsf
	 fdixIl+VsaQK6emSrbutqqZ7j/k61Z8IDU6DzgWVzOKqDbYHcKP9zJimTSi+iVOUzszIX
	 z7Lm8Cc9lIrKtewwhBfCRpo5ToaFRsed4EYAensaK5mZGrFLsSJN2CvxBZUN9Vc8yC9g+
	 baGv/QiS+oEkIAr9e0nN6YdQ3IvbXNNjIWFBjbjniUVgLI6FQ9Cqnk1pwjmYPqZbzdO9G
	 ETyjoaCiEt4qW5RK6y0BHpR3e3PlKAXxWRoccxgM2DxOoBx/aAjYI1Qnj0HXeW6tFgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zX8OGEfLFGtorWxYFS4Yag3CUaXahlHcZyg8u0XBH7A=;
	b=c/NuW3VZWUchq3ASlfBLLB1ZYphDZs5jkDA/IrFGgMSZ6SUuJWbjUf80RxyofG7DUkSm
	 eBKp+gGrKJn+18Ko9puVCAtdXWsfD3sE0ZTDS3LSABdCwK3kh4DYbQFnLvK9xxCwV6UnE
	 ZYVNYpCH1mLQ1dnZnpkl4ra8HHGeGoVC2d+Vz4CZDBQFTRJTOSKaK38uZwII5lFpK8hMW
	 NAYjLUZ3sWgjycnahONaSUAFb3JWgnKyuKILyyIbTxqCSfQoe5ETfC2+yUW7ZwmeOCPDg
	 cJ5rzAbI5+tCyRI/AbYxjIby1Bspwvbng6DewPp6blf7Nv2WwaK/eRoZEIcLa8uqiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9Xs8Go0;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8DA606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8DA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9Xs8Go0
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1546613c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187210; x=1795792010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX8OGEfLFGtorWxYFS4Yag3CUaXahlHcZyg8u0XBH7A=;
        b=U9Xs8Go0LI27CFYgd/KCrk8P8ekUhLrKSnTDBEHNpIoBVvnC5u5iTzLGHtq5DpGw4N
         L1/DcuNq3sdjBEdI1uA7K2NAdvnBGMLRkQ+EHZYGtYWSmnC1NC0rwHBpRmdsrt5fINvb
         OOGZuk19fM0kUOfoGeROKz3/J41QB5h005Kuv0VvYKgjkAlsSVmyg3+g6l3G1Y6XDZfa
         HeuU7hx9G9Ri1fF+iENd7oFiDbR5P1mUQRA+K8RSVMvo5TQAJJPQNidav/ZUPRSdAtUG
         tQcMl3m4TgoJE0OSPhS2tXOBt23YAKlS26L+6gaeRTg4b6QaDj5aYprw3UJM/RovJOYH
         JFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187210; x=1795792010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zX8OGEfLFGtorWxYFS4Yag3CUaXahlHcZyg8u0XBH7A=;
        b=YxyrEVjidbXqHOla4jlmf2Z5KCf0ZTa+1G0GXzBKcIekIFH+QiNaw6f7F9uYYwK6SY
         iHav5sr/u7rUWEVuSloeyzhTjpqoPDJ/Kn31IJdLJV0yg/7DiFDl7QnqIj0pgrxqFnTL
         p5INR8IkX3tVW5CqyNt98LJF5O64F5HnsRp8+CGHo6mLMR1H0Iu/yKcFXrFWMNYmSZI2
         Qty1anFKkij6kxW5JB2sj3gmjPAuWpGjBgXwdD2QwT6/UAE8ReE9q/zZuT2IXBYO/Jqe
         pzrfXfoA/+lV2YQU09RIHcQHdJ7YTlyA+9MHcbSsv4Lh8c/b5eC6A0OrvTwpWU15Jo7a
         zwng==
X-Gm-Message-State: APuU4Z83VtXvcbFax0roa9QkZmgRS2tgIfnYIcmtt4ZsP0C49FsAiwlV
	ocKBkbDptFdicuxIalRWJfFTxmQdw98aW9DFx7u3rpYJU/LyuK9PUvOP
X-Gm-Gg: AYBFou1zIGtFVSfg7EAL4BkK4vjxq2/n9GOn3F50y3MAdSScD0Gofb/8nfJunsgKAfQ
	QqJS7CrMU8ugBilCXcnsd0l8DCZyRES+oDNFti0hME2kEU69Jc9ZtFi+F3sz+cfOEPVWOWqNDzk
	1sIGt+XZ4V68aonD/w3QgCWCghPPeyM2qHQgEu7p5sFU2htqTW7CPleuIE0Vm/bFoybHnVoyvg2
	z9gVNI1dubpZaMu5XsJg9FBaePzP8cabw+bVe6RHcPxuJvxbEyYHOvxiPjgi+8yFawzk0DDOcE9
	NcobTEFW6GjQQvwtegy4qaiW8Gw8ZUliQHBtc89S93BTszCbUB8jToQ4UTPNB3hVUl+wBwMv4++
	EvqQj84SJVfo3wiky7YkbnkEWm8AFD5e/JK9s8vRlHBB5mGL+2gKQvRptQSUu4bYp6RQM4sZOeD
	wjZUin0hRKwrcWt4Jl+5qOe7iw6o5D80E4rB65MXZ0hXWCBSKBJvVcURKHhd5lnX0e4e81i0Nv9
	IQ1XZH62PgLNpY8E03ZYg6cDSaInX/xfS7/8Wj4VcMnjRLZXhtgYtnnpg1h/8tFLPGw8/9PAcSV
	AEMD5bLlYhfiAk6614GqpfngUWUINu8cI0sGtoJfT3wNrLEUlihGR9eyNhTeD0U=
X-Received: by 2002:a05:7022:3a83:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b55690779bmr3017028c88.39.1795187210255;
        Fri, 20 Nov 2026 07:06:50 -0800 (PST)
Received: from IN01-9QQVVV3.CAMNWK.COM ([171.76.82.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm7844902c88.12.2026.11.20.07.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:06:49 -0800 (PST)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	bpf@vger.kernel.org,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Subject: [PATCH iwl-next 1/2] i40e: wait for one RCU grace period in i40e_down(), not one per queue
Date: Fri, 20 Nov 2026 15:05:26 +0000
Message-ID: <20261120150527.14649-2-shital.gandhi45@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150527.14649-1-shital.gandhi45@gmail.com>
References: <20261120150527.14649-1-shital.gandhi45@gmail.com>
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

i40e_down() calls synchronize_rcu() inside the per-queue loop whenever
XDP is enabled, so bringing a VSI down waits for num_queue_pairs
back-to-back grace periods. This is paid on every ifdown, reset, MTU
change and XDP attach/detach.

The wait is there so that in-progress ndo_xdp_xmit and ndo_xsk_wakeup
calls have finished before the XDP rings are cleaned. Both bail out
when __I40E_VSI_DOWN is set. When the caller has set it, as
i40e_vsi_close() and the reset path do, a single grace period after
that covers every ring. Callers that do not set it,
i40e_vsi_reinit_locked() and i40e_set_ringparam(), are not protected
against new calls by the per-queue wait either: a call can start right
after any of those grace periods.

Wait once, before the loop. While at it, use synchronize_net(), which
takes the expedited path when rtnl is held, as commit 405d9999aa0b
("ice: replace synchronize_rcu with synchronize_net") did for the same
pattern in ice.

Signed-off-by: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
---
 drivers/net/ethernet/intel/i40e/i40e_main.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index abbc71e81..99f59079d 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -7611,15 +7611,18 @@ void i40e_down(struct i40e_vsi *vsi)
 		i40e_force_link_state(vsi->back, false);
 	i40e_napi_disable_all(vsi);
 
+	/* Make sure that in-progress ndo_xdp_xmit and ndo_xsk_wakeup calls
+	 * are completed before the XDP rings are cleaned. They bail out on
+	 * __I40E_VSI_DOWN, which the caller has set, so a single grace
+	 * period covers all rings.
+	 */
+	if (i40e_enabled_xdp_vsi(vsi))
+		synchronize_net();
+
 	for (i = 0; i < vsi->num_queue_pairs; i++) {
 		i40e_clean_tx_ring(vsi->tx_rings[i]);
-		if (i40e_enabled_xdp_vsi(vsi)) {
-			/* Make sure that in-progress ndo_xdp_xmit and
-			 * ndo_xsk_wakeup calls are completed.
-			 */
-			synchronize_rcu();
+		if (i40e_enabled_xdp_vsi(vsi))
 			i40e_clean_tx_ring(vsi->xdp_rings[i]);
-		}
 		i40e_clean_rx_ring(vsi->rx_rings[i]);
 	}
 
-- 
2.53.0

