Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554148;
	b=AmDzVpc6T0Lmv6IqUdp5Uxnj4DVgfbPGg5lQiH0+EjMc+d7kfNsN+lAU0R/eXXWK75Gj
	 g855Ab4QMOLUjbKZz079dWtvJpKIsFF1yekW01+yvMIjw9F8xzwQzVxH73zmsyYdnIC4R
	 ABTAGCYTiom+gHgLs2txas48lKJXMoAEDfR4ci+McZckYkKypN+5v1oW+5OogfgsxPEyP
	 o42NDRe7cgE9bO2r+yD5XeNGYIOu37vtFIwv4e6tB7cXe8iwAyhJ+DVERVX0AA+4GBGxI
	 a0I79IaZAhAptrqhzHbTNto3CU810PxjojoHVgy+SpUYT8NyvOU2phTdEwpc76k1RRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=lN0LIdbFRBgoTNvh2FY0WEDqLMBfD1vMRoz0mR1ChNI=;
	b=grAjzWwwwYaKpFb1JMgcPIZbzw2+eMiGX16RhUheXlcjI2aQETRPl4Hs3AW1Wb880XRC
	 jR00pBaLGOGMn1BoW3ApG03I0Bc2nkq7zAThSNGH68hs6Um9RMUOuW1AfwYahhJBLSke/
	 XFkI6j3NiwmBdtdoBE/gZXstb3znmIrpsTHyjXG12o3AvE6dMyghGZuJk9zXCa0/WGlzt
	 L93AgNehSAe9VpxqOZtJKFAvGLKmA0myaTh11l9QHwhZcVjlxcC9IflZq36ehPIDDG1UF
	 Mi3fQ5GtuSq8o62ZqRez4JNs+enES3KiWDDEwAfDVq16TcwtwqF3Ms47KPOZnRIm3ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA1+320B;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545A606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A545A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA1+320B
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso2493236a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554147; x=1796158947; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN0LIdbFRBgoTNvh2FY0WEDqLMBfD1vMRoz0mR1ChNI=;
        b=GA1+320B821O1xy60RjnsPaoOs6agEFfkicaceCVePqeMX033v7n36KLO/PvHWIRzG
         //3+nxW+4B5oxveiEjqdwnv5TkUMRNYRqNRoVWe4qeoaHIPWIhRABcxh99Amjmmzio8H
         9tKvRh2n78eifEQr3nJxsc0e7POzW6IHftngXvqOxNnLKr/CtXgkBPlSAufaqIW+C19i
         5ZN5UoO6yS6T3uzb1snWHvuBPYPVmAHjlzxeMhS8kwxqkH6ew80NxqfP8bFpBcUlBUP+
         Lhz6lBrqD23wEn28u1I94D9dHZKMLCTWPNHsLziGoohBoAQTqkUkdDzj6Wh7OSjAsXKu
         AXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554147; x=1796158947;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN0LIdbFRBgoTNvh2FY0WEDqLMBfD1vMRoz0mR1ChNI=;
        b=TlLxmphysnluj7epgBvuv/axqAONZ5rkvTxScYMh1ouYLw0aiRO6GRtDwDmBLEWhJZ
         Ra+1vTBPNduLVu9qmcsnqVujbOuzVkiYCzIAVqq37TKLCJikwpvREHLJlW3ORveU3q+e
         vJPwQz0Wd/fTj9Ybxe1j6ZovKNFr726TyvPKqdT0tHJleiWoW04sqm2P7Wf/VCrES7Is
         Gda3uzaA8FIvOSaW8a3pWgff/KF9pIM0RlyO3UOU/m9s8nBxYnZn8kv2lDHP8GD9g2yL
         jR93tbEdw0TUMT732x04V11Q7q4eRcULjoq8kne9QIgePdonHuzHeFaXEtq1O6O59oVn
         o9TQ==
X-Forwarded-Encrypted: i=1; AL+hErEP1ot4vQGU0AmT5TkqopDxXbEMr7fCkCKtJa5xXjgjZIJ3ss3JkIIi6oetLRjPlz4oLAGzz14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MrRJL/wO0RWEgwLUNJM5kXWNP0Vf6WmSx8g1aNG5JMEL5/IzG
	86FynDDoqKboBwsWhpKFw8dSYU1LvPcfOX6rBFWnx5rpHBpFvMJUZzDW
X-Gm-Gg: AZFdTZcfTeMI5VrriqmP+Afs3uvi3pUYrUkD/IK6318jhngvLA7Ie68aloiPyGxLDpn
	OAEICxMCbLMJx+LEH8oLlh+swKIKjeX96i43jYEVCwmjny+e24ej3UL833uzfoMqNb+ZotbW/kh
	D5N9wjX8vwnFbLj+snEcWLt3a1+mhj4eOnv14l4mjQ2n607HR7ZvlNWDddrgqyCItoaPqr1UBE3
	uZ+R1+f4jRRe48eYHN7b1zZMORJ0PQqDXnkIoYkUA++CRA4oNCuGCGyXjNJdGggloDrOHA4E8ir
	7tYvuoszWf2CDpK6mseRZy56nNyTe8mzl1B2fAn7gSLYwfHSiFmcFNuiZI5fk1jkxU0RfDzf0rC
	lPIrpS/gNJlasagBao6C5aNibjIMqV09h3GjhX0S1I+gAN1mz/axmg/OgCD9xkaqcJnWhGG73uX
	bYRv75VJBWZX0Xc+IEwxAS8Ampe+Gih6GBh14Ef63SmvW0SPlhKDu/C4g5hd2LLdDfh8CisckKD
	RCQ2pS5le76spOVsDPugEX7QzC1u6W4jzvQH7bUEnB4jUy/5SAKyCQN3Y9prz/xmVuFSFOjXUv9
	RJBxWe5X31vKbXZwaR6QEpJ5PxY5CgsmG/S9hVpYW6wq+Czc+0pGtlEbqmwmPDVdeiyT85JgFjT
	DSYWRTj3+p5qdFm8gVe4ypH6rSrXgNoZTF2ekvrn6DXEHa7cmaHeRwkc=
X-Received: by 2002:a17:90b:4f8f:b0:3b4:f260:72de with SMTP id 98e67ed59e1d1-3b4f2607685mr359340a91.64.1795554146817;
        Tue, 24 Nov 2026 13:02:26 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm27414620a91.10.2026.11.24.13.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:02:26 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 21:02:25 +0000
Message-Id: <DN3QTN97ANJV.14Z27ER78AES8@gmail.com>
Cc: "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski"
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <netdev@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf.kernel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] bpf: add bpf_sk_assign support on
 netkit egress
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Nikolay Aleksandrov" <razor@blackwall.org>, <bpf@vger.kernel.org>
In-Reply-To: <20261124151244.1423343-1-razor@blackwall.org>
References: <20261124151244.1423343-1-razor@blackwall.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 07:12 AM Nikolay Aleksandrov <razor@blackwall.org> wrote:
> This series builds on Daniel's work [2] to steer netkit traffic to a
> transparent proxy in the receiving namespace. The receive backlog can
> outlive the transmit path's RCU read-side section, so the skb takes its
> own socket reference even for SOCK_RCU_FREE listeners.

can we do the assign at tcx ingress of the receiving netkit device ?
That works today. After NETKIT_PASS the skb goes through
sch_handle_ingress() of that device. It runs after the backlog, so
the listener stays borrowed under RCU.
tc_netkit_pkt_type already runs such a pair: tc1 in netkit, tc7 at
tcx ingress of the peer.
netkit scrubs skb->mark before the prog runs. So the netkit prog can
pass its verdict to the tcx prog in the mark.

assign_proxy_sock() from patch 4 needs no change for that, I think:

  SEC("tcx/ingress")
  int assign_proxy(struct __sk_buff *skb)
  {
          int ret = assign_proxy_sock(skb);

          return ret && ret != SKIP_PACKET ? TCX_DROP : TCX_PASS;
  }

  bpf_program__attach_tcx(skel->progs.assign_proxy,
                          if_nametoindex(HOST_DEV), NULL);

The two ways:

                      netkit prog             tcx ingress prog
                      (this series)           on nk_host (today)
  ------------------  ----------------------  -----------------------
  kernel changes      patches 1 and 3         none
  listener, UDP sk    refcount inc and put    no refcount
                      per skb
  other netkit skbs   netkit_run() sets and   one more prog, only
                      clears sk_assign_skb    after NETKIT_PASS
  who sees the skb    backlog, generic XDP,   same as today
  with assigned sk    tcx ingress, the rest
                      as today

With a UDP proxy every datagram does an atomic inc and dec on one
socket, from all cpus.
commit 7ae215d23c12 ("bpf: Don't refcount LISTEN sockets in sk_assign()")
removed that for tc ingress.

Then there is no need for sock_pfree_ref, sk_assign_skb,
BPF_RI_F_NETKIT_SK_ASSIGN and the second set of rules in the helper doc.

pw-bot: cr
