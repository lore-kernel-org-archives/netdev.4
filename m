Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435299;
	b=tUeINOt4BheZw22WwFfKAalWRbHmdGBKWBLNE1ECTKLg4sG3icVfgjt0S0VQ/lKSot1C
	 03UTtft7ejFCEQ4EdgUbeD5e1fqCDCcx2iMRePqXp6uUN6VexM64AbIgdgVUnk/HFZ5mI
	 vzm7OnU3WG+NxaQ20lBF07P8nmCkpCxRpGO+KQ9OKtD0zeGcC8xMNHraD58AjvCHoytBK
	 41DdS28nFbPLTh1GiQiSlKL0Dy4w2WdiZRh0IL7zjvCIC+pTNdTO744qeusm1eobupl6r
	 YXGdg3fl2XvrG/pITtoYi8K1fHR3LL26XdPD4uwCCKt0rY/Lv1ltSy3VLxWIgvjRZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435299;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YnMwHbaiMPLKKj5/cjoUKKWrX4fraOVi4tcjJaxhKGA=;
	b=apWBb3OX+V8uQGf2wDHvaFHo7MuMSK2ln+5wuU9xvt19n619DfGV9UYOlViH0vwb31qo
	 isit47+R6g5EeebTgq80xRX8nyKZhNg6iy0dgHNi2ybNcxzMUlpn9Rrg6zqZz63oMZw+q
	 Wzj239sV3Xrj5Bzk5OtHH05/72pVcof8CANRd7q3fztH8zdG1Eaj1NiZXispCHuXmSBHZ
	 yp/1vAPy0t7+ZdzgeJByyJz8rq+GekARDY4nhZsJiVCW+mv/iz15sG7iCXrL7X/bmNfnx
	 B79eUKFBcGN/Ux7WXJUN3d+tgeDJ2QIUBwGSPwXhR0WVsxCUlhtL6YWa/nyloPxjvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx0ANp02;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C2606A31A;
	Mon, 23 Nov 2026 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx0ANp02
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3501F000CA;
	Mon, 23 Nov 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435298;
	bh=YnMwHbaiMPLKKj5/cjoUKKWrX4fraOVi4tcjJaxhKGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gx0ANp02D3JqsPCteetrYneO5TI7uhaEJAiEWrKK9CT6pfG3zvICVfDt/pKF4AUS1
	 wjH/F8JgMqlbejuPZV4i7cnHpoT5hiMhxYminv2oVZ8U1FN6RhGkNZXYULR3JZ32wz
	 AqKHhT+Nk5o26cGyhf7iRRivIhvsEOx01OGJWxrgMi9V1VueTy++XRlVzM6s0/lR8y
	 sjbREv7VuybQ1hQat32YWzIIixStS98CasnwbVfZQn9YtwpgS/VWmZLeveHsziAvQY
	 AQI9j3a4Tsmg83KJ1oNStNgKVP+J9MDshLWhatknLEfzn3ylvZp5q6FHV57HvQukWs
	 bbkbwgUwO1bmQ==
Date: Mon, 23 Nov 2026 12:01:34 +0000
From: Simon Horman <horms@kernel.org>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH iwl-net] i40e: hold mac_filter_hash_lock while validating
 VF cloud filters
Message-ID: <20261123120134.GA31322@horms.kernel.org>
References: <20261117031553.1728084-1-lcy8047@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117031553.1728084-1-lcy8047@gmail.com>

On Mon, Nov 16, 2026 at 10:15:53PM -0500, Changyul Lee wrote:
> i40e_validate_cloud_filter() runs in the VF message path, which holds
> neither RTNL nor vsi->mac_filter_hash_lock. It looks up the destination
> MAC with i40e_find_mac() and walks vsi->mac_filter_hash for the VLAN
> without the lock. Meanwhile the host can change the VF MAC or port VLAN
> with i40e_ndo_set_vf_mac() or i40e_ndo_set_vf_port_vlan(), which delete
> filters under the lock and free them in __i40e_del_filter() or
> i40e_sync_vsi_filters(). The lookup and the walk can then read a freed
> struct i40e_mac_filter.
> 
> Do the lookup and the walk under mac_filter_hash_lock, as
> i40e_vc_add_mac_addr_msg() does, and do not use the filter after
> dropping the lock.
> 
> Fixes: e284fc280473 ("i40e: Add and delete cloud filter")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus PCI_IOV, I40E and W=1.

Thanks, as a fix this approach looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

I do wonder if, as a follow-up for net-next, it would be worth
factoring-out the basic filter check. It seems to lead to easier
handling of unlocking on error. And as a bonus, tighter scoping
of local variables.

Something along these lines (compile tested only!):

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index da1f1a9c4124..d4f0fb7b5996 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -3579,6 +3579,62 @@ static int i40e_vc_disable_vlan_stripping(struct i40e_vf *vf, u8 *msg)
 				       aq_ret);
 }
 
+/**
+ * i40e_validate_basic_filter
+ * @vf: pointer to VF structure
+ * @tc_filter: pointer to filter requested
+ *
+ * This function validates a basic cloud filter programmed as TC filter for ADq
+ *
+ * Return: 0 on success, negative value on failure
+ **/
+static int i40e_validate_basic_filter(struct i40e_vf *vf,
+				      const struct virtchnl_filter *tc_filter)
+{
+	struct virtchnl_l4_spec mask = tc_filter->mask.tcp_spec;
+	struct virtchnl_l4_spec data = tc_filter->data.tcp_spec;
+	struct i40e_pf *pf = vf->pf;
+	struct i40e_mac_filter *f;
+	struct i40e_vsi *vsi;
+	struct hlist_node *h;
+	bool found = false;
+	int bkt, err;
+
+	vsi = pf->vsi[vf->lan_vsi_idx];
+	spin_lock_bh(&vsi->mac_filter_hash_lock);
+	f = i40e_find_mac(vsi, data.dst_mac);
+
+	if (!f) {
+		dev_info(&pf->pdev->dev,
+			 "Destination MAC %pM doesn't belong to VF %d\n",
+			 data.dst_mac, vf->vf_id);
+		err = -EIO;
+		goto out_unlock;
+	}
+
+	if (!mask.vlan_id)
+		goto out_unlock;
+
+	hash_for_each_safe(vsi->mac_filter_hash, bkt, h, f, hlist) {
+		if (f->vlan == ntohs(data.vlan_id)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_info(&pf->pdev->dev, "VF %d doesn't have any VLAN id %u\n",
+			 vf->vf_id, ntohs(data.vlan_id));
+		err = -EIO;
+		goto out_unlock;
+	}
+
+	err = 0;
+out_unlock:
+	spin_unlock_bh(&vsi->mac_filter_hash_lock);
+	return err;
+}
+
 /**
  * i40e_validate_cloud_filter
  * @vf: pointer to VF structure
@@ -3592,11 +3648,6 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 	struct virtchnl_l4_spec mask = tc_filter->mask.tcp_spec;
 	struct virtchnl_l4_spec data = tc_filter->data.tcp_spec;
 	struct i40e_pf *pf = vf->pf;
-	struct i40e_vsi *vsi = NULL;
-	struct i40e_mac_filter *f;
-	struct hlist_node *h;
-	bool found = false;
-	int bkt;
 
 	if (tc_filter->action != VIRTCHNL_ACTION_TC_REDIRECT) {
 		dev_info(&pf->pdev->dev,
@@ -3623,37 +3674,9 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 	 *		  Trusted.
 	 */
 	if (mask.dst_mac[0] && !mask.dst_ip[0]) {
-		vsi = pf->vsi[vf->lan_vsi_idx];
-		spin_lock_bh(&vsi->mac_filter_hash_lock);
-		f = i40e_find_mac(vsi, data.dst_mac);
-
-		if (!f) {
-			spin_unlock_bh(&vsi->mac_filter_hash_lock);
-			dev_info(&pf->pdev->dev,
-				 "Destination MAC %pM doesn't belong to VF %d\n",
-				 data.dst_mac, vf->vf_id);
-			goto err;
-		}
-
-		if (mask.vlan_id) {
-			hash_for_each_safe(vsi->mac_filter_hash, bkt, h, f,
-					   hlist) {
-				if (f->vlan == ntohs(data.vlan_id)) {
-					found = true;
-					break;
-				}
-			}
-		}
-		spin_unlock_bh(&vsi->mac_filter_hash_lock);
-
-		if (mask.vlan_id) {
-			if (!found) {
-				dev_info(&pf->pdev->dev,
-					 "VF %d doesn't have any VLAN id %u\n",
-					 vf->vf_id, ntohs(data.vlan_id));
-				goto err;
-			}
-		}
+		int err = i40e_validate_basic_filter(vf, tc_filter);
+		if (err < 0)
+			return err;
 	} else {
 		/* Check if VF is trusted */
 		if (!test_bit(I40E_VIRTCHNL_VF_CAP_PRIVILEGE, &vf->vf_caps)) {
