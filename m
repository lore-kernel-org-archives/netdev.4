Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772837;
	b=3cFRVokLhYZbqjiVNLs1ItDb19v9uY5eXtn3n9uh8jONWT3+NSTI3Y21ZvuTVUvCUW/Q
	 m4DGZCSc39pfafM12owgje1ulCDSO05SYp2x42/yqPTs1hu4j9sVTbdHIeYHPQJj6SR6U
	 /vvqwQcn6z5ej11rOJQW/MsVVnoJccTnDM22q+ruJFCFtEE2D9ow40V24EWAcIpSHNnv+
	 gvZBerfdpJVOaE/XWoauji0755U/OZnCuj9pHSASGXji+I8cmng4I9M99vq8TOVbhq9Vv
	 zI+yQoQa/BDO/FPEw/AO2l0OMDbkxKcnhGWU6ALIjL6RBtXO3l2LllIflHOq7uPP1GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PLRbzm/g+xKhxqjZZVoSxcrQRk8KbzQXcb27AWF+62Q=;
	b=foNxbPFbW1ll5LHOiwI4p2k/vkhg2swSn/TWZGQC6iyou7TgYijqTvMUYdNqP1u02MIY
	 ONqWTUmcu0Cu8Y3gpAT3EK9a2Xw7SHN1lP7G5dSDRqFMZecj2yd6sS5oin8CATYl0/1YY
	 +ZU8iCsCrIFMeAKUtP98oDqX75RHaCDYIvyfrI93ECNT2eMqr3Y7+Mtw+3jSW64DclSQJ
	 rknRo8fmPRH6RNJDNR98xbgl5vbdYwf8ZTBxVaJoSyhEiKh+IPRfAzl7pN7eTZ1swEc4C
	 I3jKe6Jickbs/jBEkGvy/m+zVhAkUsAzDP3YzncTc0CHhr+ougQ6VkLlWPgFigxWpdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=mQcwrZ4s;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE2606A6AB
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EE2606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=mQcwrZ4s
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso11244605c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772836; x=1796377636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLRbzm/g+xKhxqjZZVoSxcrQRk8KbzQXcb27AWF+62Q=;
        b=mQcwrZ4szuaNurUjRKI+RXWhXjrGtLZnPP+hF3G8TpuIwhn5OJy3SEAcXFgUraFTN5
         xUmuq4ZhwgkDmSx7uUdfO7UL6BZSPHMmkKDtsaQxFzSWt5xbd6ozvUlB/MPSR9S0EHR9
         3f9p70BfXUAWbvhJQjnlu6bcGBiYWR5mGvdAkRAl72TgjpwdNiWu9cItXPymbdXJ3Nxg
         aP+yY7BDcBDVT1OHBAFc/nJKZoj5Zw8pBU99p17uBCA2AJl3OU89aHq+6/e5WGhze1ts
         E7szjTBFswHaKv1jCLGidIUJ4gY5t5tT9qdyjlPscPDTS3jx9/Y30iIyT1fSufS+uHZm
         S5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772836; x=1796377636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLRbzm/g+xKhxqjZZVoSxcrQRk8KbzQXcb27AWF+62Q=;
        b=U4eQ2SyL2Ut3Mn9jGF+8zx/rBBEiAvTSaAnVxgQtDU02HR3g+0gxYsGpqKhIXEsqFV
         dORCVLiEl/UzE1C1dssieMXtJnRbHPtCJ1SHMXnOFAaz3Sv5UiCH8w4MUWLHYRBZa91t
         aIDsQHjR9nOfg7GpjwGqIqjdcD9tyhP3Lbq0cSGAJ4LLJfjL4mFqh3aARmsQyKqsT54q
         hBCeRWFeM4zvjMXfGXX/YAYNAv2r8suDbL0yqZU9BcYcrSjMiixjKyeA3M2EC3aUFSI2
         FL7zLTADE7bVyHmKmuMin8ng+NeEtaHUpbn8N+jr64fm5aPwc3ZF2+qvEhLMq4lHiudq
         4opw==
X-Forwarded-Encrypted: i=1; AL+hErF5mr2VOcGBcQ1u6HVdd06bamkKtXLyTaOttZzHmtPXYuBHD9EwCOJesSoNtH63jX4YQGdIExA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9McIuOHqwOE+nT/M3RF5pAVlsyleodHez6MtQuXlnix1vI3cp7
	946ZFjIkqaBbOhbCFWXSXixjtrk0djrvwHvRG+ZoUr8hEJl4Dat7I9TDS0bQWWTeQOWoE+Cce1A
	hPseQsOQ=
X-Gm-Gg: AZFdTZf3NkRPfItltniykqTe89aHKnrWC4R8TSLFF53FY5o+klWWw+MCf5qq1/cHuGR
	E4D/IRXN0+VcaONmF8TLHs6IRDReCcSd3wFfFBPkn2KH2tUwXuk99LU5P8r6WtEeh/ruFSkTUFz
	dgxzVWgdIgc0VuO8LngqtQblO32pF3HnSrFP+WArPIvXArAhU0u+ndk9eNrHWyx7mnTRgJLcMl+
	n9IRoRB2a1MDS7Qy5bfjL0TtF0L+SUMfSzcHA64+cfVP6D0OqrH2WWISDZwQwi7uSgurreITv1M
	d+WBWMUvAG8C6BuyH3E5OcNuGwa5cNBR8z7mbHY2gTdG85RP1FRWPQiy9ZhAbUViZJpFUkmZRB9
	IYBP1xLhNt0SJFT1hDegMiueo6Bxx5N5gwJY1Xjlmygp5ABPsi8kLjJxvWuOz1cjDfCnKIUuUJB
	5PbcwlnQgKAbzWq9chOriFydzkzD378gzdeMPXKcyHxzK3m3HXwtjv3MAyaPFCWrWvR2a4iAHwH
	f8CSreqo/gNrXOTJSeN548ptgYDUQztJ2pEM8v1E4nO7mmyTTo3Ekkd6NdxqvTVKjVV36LrF2ar
	1u797vjKtlZfAS/ZIJ9udphXY2RgP56dgDXcU18SM4DutZjzbGa1heZWAClBozNNTgtM0SayFZh
	HnqlFrK5Gm18yZS5CMPOKbEr/EkQ=
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr26396575c88.40.1795772835794;
        Fri, 27 Nov 2026 01:47:15 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:14 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 06/12] amt: size the encapsulation headroom by the outer IP version
Date: Fri, 27 Nov 2026 09:46:57 +0000
Message-ID: <20261127094703.3025517-7-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

The amt device reserves AMT_RELAY_HLEN or AMT_GW_HLEN of headroom and
subtracts the same amount from the stream device's MTU. Both assume a
20-byte IPv4 outer header, which is 20 bytes short of an IPv6 one. A
relay's multicast payload close to the device MTU would then be larger
than the tunnel MTU that amt_send_multicast_data() computes from the
route, and be dropped there: an IPv6 payload with a Packet Too Big, an
IPv4 payload without notice, as icmp_send() does not answer multicast.
Sizing the device for the IPv6 headers makes the stack refuse such a
payload first.

Add AMT_RELAY_HLEN6 and AMT_GW_HLEN6, pick between the IPv4 and IPv6
sizes in amt_hlen(), and use amt_hlen() wherever the device sizes its
headroom and MTU: at newlink and on NETDEV_CHANGEMTU of the stream
device.

amt_v6() is still false for every device, so there is no functional
change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 26 +++++++++++++++-----------
 include/net/amt.h |  7 +++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 3972b3ecc..ecc30823d 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -104,6 +104,14 @@ static unsigned int amt_ip_hlen(const struct amt_dev *amt)
 	return amt_v6(amt) ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
 }
 
+/* Headroom the device reserves for its outer encapsulation. */
+static unsigned int amt_hlen(const struct amt_dev *amt)
+{
+	if (amt->mode == AMT_MODE_RELAY)
+		return amt_v6(amt) ? AMT_RELAY_HLEN6 : AMT_RELAY_HLEN;
+	return amt_v6(amt) ? AMT_GW_HLEN6 : AMT_GW_HLEN;
+}
+
 /* Snapshot the outer source address of a received AMT message. */
 static void amt_outer_saddr(const struct amt_dev *amt,
 			    const struct sk_buff *skb, union amt_addr *addr)
@@ -3937,10 +3945,10 @@ static int amt_newlink(struct net_device *dev,
 		amt->qrv = READ_ONCE(amt->net->ipv4.sysctl_igmp_qrv);
 		amt->qri = 10;
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_RELAY_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_RELAY_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_RELAY_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	} else {
 		if (!data[IFLA_AMT_DISCOVERY_IP]) {
 			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
@@ -3963,10 +3971,10 @@ static int amt_newlink(struct net_device *dev,
 		}
 
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_GW_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_GW_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_GW_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	}
 	amt->qi = AMT_INIT_QUERY_INTERVAL;
 
@@ -4087,11 +4095,7 @@ static int amt_device_event(struct notifier_block *unused,
 			amt_dellink(amt->dev, &list);
 			break;
 		case NETDEV_CHANGEMTU:
-			if (amt->mode == AMT_MODE_RELAY)
-				new_mtu = dev->mtu - AMT_RELAY_HLEN;
-			else
-				new_mtu = dev->mtu - AMT_GW_HLEN;
-
+			new_mtu = dev->mtu - amt_hlen(amt);
 			dev_set_mtu(amt->dev, new_mtu);
 			break;
 		}
diff --git a/include/net/amt.h b/include/net/amt.h
index 245947113..eabe6fa7a 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -434,9 +434,16 @@ struct amt_dev {
 #define AMT_GW_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_gw_headers))
+/* IPv6-outer gateway headroom: the outer header is a struct ipv6hdr. */
+#define AMT_GW_HLEN6 (sizeof(struct ipv6hdr) + \
+		      sizeof(struct udphdr) + \
+		      sizeof(struct amt_gw_headers))
 #define AMT_RELAY_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_relay_headers))
+#define AMT_RELAY_HLEN6 (sizeof(struct ipv6hdr) + \
+			 sizeof(struct udphdr) + \
+			 sizeof(struct amt_relay_headers))
 
 static inline bool netif_is_amt(const struct net_device *dev)
 {
